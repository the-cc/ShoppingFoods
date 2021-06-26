package com.cn.web.backand;

import com.cn.model.SmUser;
import com.cn.service.SmUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private SmUserService userService;

    //管理员入到主页
    @RequestMapping("/slogin")
    public String Users(HttpServletRequest request, String username, String password){
        SmUser smUser = userService.selectByStauts(username, password);
        HttpSession session = request.getSession();
        if(smUser != null){
            if(smUser.getSuStatus().equals(2)){
                //将用户放入session中
                session.setAttribute("smUser", smUser);
                //清除错误提示
                session.removeAttribute("lgn_error");
                return "redirect:Administrator/index";
            }
        }
        session.setAttribute("lgn_error", "lgn_error");
        //登录失败返回登录页面
        return "redirect:Administrator/login";
    }


}
