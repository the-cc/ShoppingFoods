package com.cn.web.backand;

import com.cn.model.SmProduct;
import com.cn.model.SmProductCategory;
import com.cn.service.SmProductCategoryService;
import com.cn.service.SmProductService;
import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/product")
public class SmProductController {

    @Autowired
    private SmProductService smproductService;//低耦合

    @Autowired
    private SmProductCategoryService smproductCategoryService;

    //1.商品的分页查询方法---分页查询的请求
    //分页：${pageContext.request.contextPath}/product/list?page=当前页-1
    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "page", defaultValue = "1") int page,
                       @RequestParam(value = "pageSize", defaultValue = "5") int pageSize) {
        //1.调用service层的分页查商品信息的方法
        List<SmProduct> smProducts = smproductService.list(page, pageSize);
        //2.返回model(ebProducts)和视图(jsp)
        model.addAttribute("smProducts", smProducts);//key-value

        //查找所有小类
        List<SmProductCategory> small = smproductCategoryService.findSmall();
        model.addAttribute("small", small);

        //2.1.传递当前页到product.jsp
        model.addAttribute("curPage", page);
        //2.2 传递最大页到product.jsp
        model.addAttribute("maxPage", ((Page) smProducts).getPages());

        return "Administrator/providerList";
    }

    //根据商品名称或商品种类的信息
    @RequestMapping("/findByProduct")
    public String successProduct(Model model,
                               @RequestParam(value = "page",defaultValue = "1") Integer page,
                               @RequestParam(value = "pageSize",defaultValue = "5") Integer paseSize,
                               @RequestParam(value = "spcId",defaultValue = "0") int spcId,
                               @RequestParam(value = "spName",defaultValue = "null") String spName){
        //查找出商品名称或商品种类信息
        List<SmProduct> smProduct = smproductService.selectSuccess(spcId, spName,page,paseSize);
        //查找所有小类
        List<SmProductCategory> small = smproductCategoryService.findSmall();
        model.addAttribute("small", small);

        model.addAttribute("smProducts",smProduct);
        model.addAttribute("page",page);
        model.addAttribute("maxPage",((Page)smProduct).getPages());

        return "Administrator/providerList";
    }



    //2.商品添加的方法---商品添加的请求
    @RequestMapping("/to_save")
    public String toSave(Model model) {
        //查询所有大类和小类
        //1.调用商品分类的service层 查询大类和小类
        Map<String, List<SmProductCategory>> categoryMap = smproductCategoryService.findBigAndSmallCategory();
        //2.通过model传递给jsp
        model.addAttribute("categoryMap", categoryMap);

        return "Administrator/providerAdd";
    }

    //3.删除商品的方法---删除商品的请求
    @RequestMapping("/delect")
    public String delect(int spId) {
        int delect = smproductService.delect(spId);
        if (delect < 0) {
            return "Administrator/index-error";
        }
        return "Administrator/index-result";
    }

    //更新
    @RequestMapping("/edit")
    public String edit(SmProduct smProduct,
                       MultipartFile uploadFile,
                       HttpServletRequest request) {
        if (uploadFile.getSize() > 0) {
            //0.1 获取上传文件的文件名  1.jpg
            String originalFileName = uploadFile.getOriginalFilename();
            //0.2 生成一个新的文件名  xxxx  + .jpg
            String newFileName = UUID.randomUUID().toString() + originalFileName.substring(originalFileName.indexOf("."));
            //0.3 构建file对象
            //1)获取服务器的Imger/product 路径ß
            String rootPath = request.getServletContext().getRealPath("/") + "Imger/product";

            File file = new File(rootPath, newFileName);
            //0.4 将文件上传到服务器Imger/product
            try {
                uploadFile.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            //设置修改的文件的名称
            smProduct.setSpFileName(newFileName);
        }
        //1.调用service更新商品的方法
        int result = smproductService.update(smProduct);
        //2.根据添加的结果(result)跳转页面
        if (result <= 0) {
            return "Administrator/index-error";
        }
        return "Administrator/index-result";
    }
    //添加商品信息
    //添加商品信息
    @RequestMapping("/add")
    public String addProduct(SmProduct smProduct, MultipartFile uploadFile, HttpServletRequest request) {
        System.out.println(smProduct);
        System.out.println(uploadFile);
        if (uploadFile != null) {
            //0.1 获取上传文件的文件名  1.jpg
            String originalFileName = uploadFile.getOriginalFilename();
            //0.2 生成一个新的文件名  xxxx  + .jpg
            String newFileName = UUID.randomUUID().toString() + originalFileName.substring(originalFileName.indexOf("."));
            //0.3 构建file对象
            //1)获取服务器的images/product 路径
            String rootPath = request.getServletContext().getRealPath("/") + "Imger/product";

            File file = new File(rootPath, newFileName);
            //0.4 将文件上传到服务器images/product
            try {
                uploadFile.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            //1.2 设置上传的文件真实名字
            smProduct.setSpFileName(newFileName);
            int insert = smproductService.insert(smProduct);

            //2.根据添加的结果跳到结果页面
            if (insert <= 0) {
                return "Administrator/index-error";
            }
            return "Administrator/index-result";
        } else {
            return "Administrator/index-result";
        }
    }
    //根据Id查询相对应的商品类型
    @RequestMapping("/to_edit")
    public String editProduct(Model model,int spId){
        SmProduct smProduct = smproductService.selectbyId(spId);

        //绑定显示的商品对象
        model.addAttribute("smProduct",smProduct);
        //查询所有大类和小类
        //调用商品分类的service层 查询大类和小类
        Map<String, List<SmProductCategory>> categoryMap = smproductCategoryService.findBigAndSmallCategory();
        //通过model传递给jsp
        model.addAttribute("categoryMap",categoryMap);

        return "Administrator/providerUpdate";
    }
}