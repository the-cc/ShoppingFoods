package com.cn.web.backand;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**

 * 浏览器：http://localhost:8080/easybuy-sw03/manage/index
 */
@Controller
@RequestMapping("/Administrator")
public class IndexController {//服务员
    /**
     * 显示管理员首页
     * @return
     */
    @RequestMapping("/index")
    public String index(){
        return "Administrator/index";
    }

    /**
     * 显示登录管理员页面
     * @return
     */
    @RequestMapping("/login")
    public String toLogin() {
        return "Administrator/login";//login.jsp

    }


}
