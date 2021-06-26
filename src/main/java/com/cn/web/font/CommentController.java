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
        //����������
        DHnert(model);
        //������ƷID��ѯ������Ϣ
        List<SmComment> all = smCommentService.findAll(spId);
        model.addAttribute("Comment",all);

        //������ƷID��ѯ��Ʒ��Ϣ
        SmProduct smProduct = smProductService.selectbyId(spId);
        model.addAttribute("pro",smProduct);

        return "guestbook";
    }

    @RequestMapping("/add")
    public String addComment(Model model,SmComment smComment){
        Date date = new Date();
        smComment.setScCreateTime(date);
        if(smComment.getScNickName().equals("")){
            smComment.setScNickName("����");
        }
        smCommentService.insertTest(smComment);
        //����������
        DHnert(model);
        //������ƷID��ѯ������Ϣ
        List<SmComment> all = smCommentService.findAll(smComment.getScSpId());
        model.addAttribute("Comment",all);

        //������ƷID��ѯ��Ʒ��Ϣ
        SmProduct smProduct = smProductService.selectbyId(smComment.getScSpId());
        model.addAttribute("pro",smProduct);

        return "guestbook";
    }




    //���������Է���
    public void DHnert(Model model){
        List<SmProductCategory> big = smProductCategoryService.findBig();
        //��ȡ��������
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
