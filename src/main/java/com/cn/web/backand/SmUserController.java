package com.cn.web.backand;


import com.cn.model.SmUser;
import com.cn.service.SmUserService;
import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@Controller
@RequestMapping("/User")
public class SmUserController {

    @Autowired
    private SmUserService smuserService;

    //1.用户分页
    @RequestMapping("/list")
    private  String list(Model model,
                         @RequestParam(value = "page",defaultValue = "1")Integer page,
                         @RequestParam(value = "pageSize",defaultValue = "3")Integer pageSize){
        List<SmUser> smUsers = smuserService.list(page, pageSize);
        //2.指定model和view （将数据绑定视图中显示）
        model.addAttribute("smUsers",smUsers);//key-value
        //2.1 传递当前页到里
        model.addAttribute("curPage",page);
        //2.2 传递最大页到
        model.addAttribute("maxPage",((Page)smUsers).getPages());

        return "Administrator/userList";
    }

    //根据用户名查找指定的信息
    @RequestMapping("/findByUser")
    public String successOrder(Model model,
                               @RequestParam(value = "page",defaultValue = "1") Integer page,
                               @RequestParam(value = "pageSize",defaultValue = "5") Integer paseSize,
                               @RequestParam(value = "suUserName",defaultValue = "null") String suUserName){
        //查找出ID和姓名的订单信息
        List<SmUser> smUser1 = smuserService.selectSuccess(suUserName,page,paseSize);
        model.addAttribute("smUsers",smUser1);
        model.addAttribute("page",page);
        model.addAttribute("maxPage",((Page)smUser1).getPages());

        return "Administrator/userList";
    }

    @RequestMapping("/delete")
    public  String DeleteUser(int suUserId ,int suStatus) {
        if (suStatus == 1) {    //只删除用户
            int i = smuserService.delete(suUserId);
            if (i > 0) {
                return "Administrator/index-result";
            }
        }
        return "Administrator/index-error";
    }
}


