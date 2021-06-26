package com.cn.web.font;

import com.cn.model.SmComment;
import com.cn.model.SmProduct;
import com.cn.model.SmProductCategory;
import com.cn.service.SmCommentService;
import com.cn.service.SmProductCategoryService;
import com.cn.service.SmProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    SmCommentService smCommentService;

    @Autowired
    SmProductService smProductService;

    @Autowired
    SmProductCategoryService smProductCategoryService;


    @RequestMapping("/guestbook")
    public String selectCommnt(Model model, int spId){
        //导航栏属性
        DHnert(model);
        //根据商品ID查询留言信息
        List<SmComment> all = smCommentService.findAll(spId);
        model.addAttribute("Comment",all);

        //根据商品ID查询商品信息
        SmProduct smProduct = smProductService.selectbyId(spId);
        model.addAttribute("pro",smProduct);

        return "guestbook";
    }

    @RequestMapping("/add")
    public String addComment(Model model,SmComment smComment){
        Date date = new Date();
        smComment.setScCreateTime(date);
        if(smComment.getScNickName().equals("")){
            smComment.setScNickName("匿名");
        }
        smCommentService.insertTest(smComment);
        //导航栏属性
        DHnert(model);
        //根据商品ID查询留言信息
        List<SmComment> all = smCommentService.findAll(smComment.getScSpId());
        model.addAttribute("Comment",all);

        //根据商品ID查询商品信息
        SmProduct smProduct = smProductService.selectbyId(smComment.getScSpId());
        model.addAttribute("pro",smProduct);

        return "guestbook";
    }




    //导航栏属性方法
    public void DHnert(Model model){
        List<SmProductCategory> big = smProductCategoryService.findBig();
        //获取大类名称
        for (SmProductCategory bigs:big) {
            if(bigs.getSpcId() == 542){
                model.addAttribute("s1",bigs.getSpcName());
                List<SmProductCategory> smProductCategories = smProductCategoryService.selectAndsmall(bigs.getSpcId());
                model.addAttribute("s1_small",smProductCategories);
            }else if(bigs.getSpcId() == 543){
                model.addAttribute("s2",bigs.getSpcName());
                List<SmProductCategory> smProductCategories = smProductCategoryService.selectAndsmall(bigs.getSpcId());
                model.addAttribute("s2_small",smProductCategories);
            }else if(bigs.getSpcId() == 544){
                model.addAttribute("s3",bigs.getSpcName());
                List<SmProductCategory> smProductCategories = smProductCategoryService.selectAndsmall(bigs.getSpcId());
                model.addAttribute("s3_small",smProductCategories);
            }
        }
        List<SmProduct> all = smProductService.findAll();
        model.addAttribute("smproduct",all);
    }

}
