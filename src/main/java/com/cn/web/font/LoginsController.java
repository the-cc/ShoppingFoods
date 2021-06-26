package com.cn.web.font;


import com.cn.model.SmUser;
import com.cn.service.SmUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginsController {
    @Autowired

    private SmUserService smuserService;

    //登录
    @RequestMapping("/to_login")
    public String toLogin() {
        return "login";//login.jsp
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest request, String userName, String passWord) {
        System.out.println("userName=" + userName+"\tpassWord="+passWord );
        SmUser lgnUser = smuserService.login(userName,passWord);
        HttpSession session = request.getSession();
        if(lgnUser != null){
            if(lgnUser.getSuStatus().equals(2)){//登录是否是用户
                session.setAttribute("lgn_error","lgn_error");
                //重新登录
                return "redirect:to_login";
            }
            //2.将用户放入session中
            session.setAttribute("lgnUser", lgnUser);
            //清除错误提示
            session.removeAttribute("lgn_error");
            //3.重新成功往首页跳转
            return "redirect:index";
        }

        //保存一个登录失败的标记
        session.setAttribute("lgn_error", "lgn_error");
        //重新登录
        return "redirect:to_login";
    }


    //注册页面
    @RequestMapping("/reg")
    public String register(HttpServletRequest request,SmUser smUser){
        smUser.setSuStatus(1);
        int b = smuserService.selectByfind(smUser);
        HttpSession session = request.getSession();
        if(b !=0){ //  判断 用户名 || 电子邮箱 || 手机号码数据库是否有重复
            if(b == 1){ //用户名重复
                session.removeAttribute("emails");
                session.removeAttribute("mobiles");
                session.setAttribute("users","用户名已存在");
            }else if(b == 2){
                session.removeAttribute("users");
                session.removeAttribute("mobiles");
                session.setAttribute("emails","电子邮箱已存在");
            }else if(b == 3){
                session.removeAttribute("emails");
                session.removeAttribute("users");
                session.setAttribute("mobiles","手机号码已存在");
            }
            return "register";
        }
        session.removeAttribute("users");
        session.removeAttribute("emails");
        session.removeAttribute("mobiles");
        smuserService.save(smUser);
        return "register-success";
    }

    //退出用户登录
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("lgnUser");
        return "redirect:index";
    }

}
