package com.cn.web.font;

import com.cn.model.SmOrder;
import com.cn.model.SmUser;
import com.cn.service.SmOrderService;
import com.cn.service.SmUserService;
import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/MyAccount")
public class MyAccountController {
    @Autowired
    SmUserService smUserService;

    @Autowired
    SmOrderService smOrderService;

    @RequestMapping("/information")
    public String oneInfo(Model model,HttpServletRequest request){
        //2.��ȡ���ﳵ��session��
        HttpSession session = request.getSession();
        //3.1 ��ȡ���ﳵ�еļ���
        SmUser user = (SmUser) session.getAttribute("lgnUser");
        SmUser smUser = smUserService.selectOne(user.getSuUserId());
        model.addAttribute("user",smUser);

        return "MyAccount/information";
    }

    @RequestMapping("/edit")
    public String updateInfo(Model model,SmUser smUser){
        int b = smUserService.selectByfind(smUser);
        boolean bool = true;
        if(b==2){//�ֻ������Ƿ������ݿ����
            if(!smUser.getSuMobile().matches("^1\\d{10}$")){
            bool = false;
            }
        }
        if(b==3) {//���������Ƿ������ݿ����
            if (!smUser.getSuEmail().matches("^\\w+@\\w+(\\.[a-zA-Z]{2,3}){1,2}$")) {
                bool = false;
            }
        }
        if(!smUser.getSuAddress().matches("^.+ʡ.+��.+��.+(��|��|·|��).*$")){
            bool = false;
        }
        if(bool){
            smUserService.update(smUser);
        }
        return "redirect:information";
    }


    @RequestMapping("/userOrder")
    public String userOrder(Model model, HttpServletRequest request,
                            @RequestParam(value = "page",defaultValue = "1") Integer page,
                            @RequestParam(value = "pageSize",defaultValue = "5") Integer paeSize){
        HttpSession session = request.getSession();
        SmUser user = (SmUser)session.getAttribute("lgnUser");
        List<SmOrder> smOrders = smOrderService.selectByName(user.getSuUserName(), page, paeSize);
        model.addAttribute("Orders",smOrders);
        model.addAttribute("page",page);
        model.addAttribute("maxPage",((Page)smOrders).getPages());
        return "MyAccount/myorder";
    }
}
