package com.cn.web.font;


import com.cn.model.SmProduct;
import com.cn.model.SmProductCategory;
import com.cn.service.SmCommentService;
import com.cn.service.SmProductCategoryService;
import com.cn.service.SmProductService;
import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class FrontController {

    @Autowired
    private SmProductService smproductService;

    @Autowired
    private SmProductCategoryService smproductCategoryService;

    @Autowired
    private SmCommentService smCommentService;


    /**
     * 显示首页
     * @return
     */
    @RequestMapping("/index")
    public String index(Model model){
        //商品分类数据
        Map<String, List<SmProductCategory>> categoryMap = smproductCategoryService.findBigAndSmallCategory();
        model.addAttribute("categoryMap",categoryMap);
        //导航栏属性
        DHnert(model);
        return "index";
    }

    /**
     *
     * 商品详情
     * @return
     */
      @RequestMapping("/details")
    public String editProduct(Model model,int spId){
        SmProduct smProduct = smproductService.selectbyId(spId);
        //绑定显示的商品对象
        model.addAttribute("smProduct",smProduct);
        //导航栏属性
        DHnert(model);
        //根据商品二级分类查找分类名称
        SmProductCategory sm = smproductCategoryService.findById(smProduct.getSpcChildId());
        model.addAttribute("spcName",sm.getSpcName());

        //根据商品ID查询留言数量
        int i = smCommentService.selectByScspId(smProduct.getSpId());
        model.addAttribute("comStock",i);
        return "details";
    }

    /**
     * 商品浏览分页
     * @param model
     */
    @RequestMapping("/browse")
    public String productBrows(Model model,int spcChildId,
                               @RequestParam(value = "page",defaultValue = "1") Integer page,
                               @RequestParam(value = "pageSize",defaultValue = "12") Integer pageSize){
        //导航栏属性
        DHnert(model);
        //分页商品数据
        List<SmProduct> smProducts = smproductService.productlist(spcChildId,page, pageSize);
        model.addAttribute("smProducts",smProducts);
        //传递当前页到里
        model.addAttribute("curPage",page);
        //传递最大页到
        model.addAttribute("maxPage",((Page)smProducts).getPages());
        //3.商品分类数据
        Map<String, List<SmProductCategory>> categoryMap = smproductCategoryService.findBigAndSmallCategory();
        model.addAttribute("categoryMap",categoryMap);
        model.addAttribute("spcChildId",spcChildId);//穿商品分类信息
        return "browse";
    }

    //导航栏属性方法
    public void DHnert(Model model){
        List<SmProductCategory> big = smproductCategoryService.findBig();
        //获取大类名称
        for (SmProductCategory bigs:big) {
            if(bigs.getSpcId() == 542){
                model.addAttribute("s1",bigs.getSpcName());
                List<SmProductCategory> smProductCategories = smproductCategoryService.selectAndsmall(bigs.getSpcId());
                model.addAttribute("s1_small",smProductCategories);
            }else if(bigs.getSpcId() == 543){
                model.addAttribute("s2",bigs.getSpcName());
                List<SmProductCategory> smProductCategories = smproductCategoryService.selectAndsmall(bigs.getSpcId());
                model.addAttribute("s2_small",smProductCategories);
            }else if(bigs.getSpcId() == 544){
                model.addAttribute("s3",bigs.getSpcName());
                List<SmProductCategory> smProductCategories = smproductCategoryService.selectAndsmall(bigs.getSpcId());
                model.addAttribute("s3_small",smProductCategories);
            }
        }
        List<SmProduct> all = smproductService.findAll();
        model.addAttribute("smproduct",all);
    }
}
