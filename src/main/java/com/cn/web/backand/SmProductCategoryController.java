package com.cn.web.backand;

import com.cn.model.SmProductCategory;
import com.cn.service.SmProductCategoryService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/productCategory")
public class SmProductCategoryController {
    @Autowired
    SmProductCategoryService smProductCategoryService;

    //查询所有大类小类
    @RequestMapping("/list")
    public String list(Model model, @RequestParam(value = "page",defaultValue = "1") Integer page,
                       @RequestParam(value = "pageSize",defaultValue = "1") Integer pageSize){
        PageHelper.startPage(page,pageSize);
        Map<String, List<SmProductCategory>> bigAndSmallCategory = smProductCategoryService.findBigAndSmallCategory();
        List<SmProductCategory> bigs = bigAndSmallCategory.get("bigs");
        model.addAttribute("categoryMap",bigAndSmallCategory);
        model.addAttribute("page",page);
        model.addAttribute("maxPage",((Page)bigs).getPages());
        return "Administrator/providerClassList";
    }

    //根据Id查询对应的大类或小类信息
    @RequestMapping("/{spcId}")
    public String edit(Model model, @PathVariable("spcId") Integer spcId){
        //查询大类信息
        List<SmProductCategory> big = smProductCategoryService.findBig();
        //根据Id查询大类或小类信息
        SmProductCategory smPC = smProductCategoryService.findByBigAndSmallCategory(spcId);
        model.addAttribute("bigs",big);
        model.addAttribute("smPC",smPC);
        return "Administrator/providerClassUpdate";
    }

    //根据Id修改小类信息
    @RequestMapping("/edit")
    public String update(SmProductCategory smProductCategory){
        if(!smProductCategory.getSpcName().equals("")){
            smProductCategoryService.update(smProductCategory);
            return "Administrator/index-result";
        }
        return "Administrator/index-error";

    }

    //获取大类信息
    @RequestMapping("/to_add")
    public String select(Model model){
        //查询大类信息
        List<SmProductCategory> bigs = smProductCategoryService.findBig();
        model.addAttribute("bigs",bigs);
        return "Administrator/providerClassAdd";
    }

    //添加小类信息
    @RequestMapping("/add")
    public String save(SmProductCategory smProductCategory){
        if(!smProductCategory.getSpcName().equals("")) {
            smProductCategoryService.insert(smProductCategory);
            return "Administrator/index-result";
        }
        return "Administrator/index-error";
    }

    //删除大类或小类
    @RequestMapping("/delete")
    public String delete(int spcId){
        int i = smProductCategoryService.deletefindByBig(spcId);
        if(i<1){
            return "Administrator/index-error";
        }
        return "Administrator/index-result";
    }

}
