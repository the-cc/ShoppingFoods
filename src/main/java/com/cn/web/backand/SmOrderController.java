package com.cn.web.backand;

import com.cn.model.SmOrder;
import com.cn.service.SmOrderService;
import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/order")
public class SmOrderController {

    @Autowired
    SmOrderService smOrderService;

    //显示分页
    @RequestMapping("/list")
    public String list(Model model, @RequestParam(value = "page",defaultValue = "1") Integer page, @RequestParam(value = "pageSize",defaultValue = "5") Integer paeSize){
        List<SmOrder> smOrders = smOrderService.pageTest(page, paeSize);
        System.out.println(smOrders);
        model.addAttribute("smOrders",smOrders);
        model.addAttribute("page",page);
        model.addAttribute("maxPage",((Page)smOrders).getPages());
        return "Administrator/billList";
    }

    //根据ID查找对应的订单页面
    @RequestMapping("/to_edit")
    public String editOrder(Model model,int soId){
        SmOrder smOrder = smOrderService.selectByOrder(soId);
        model.addAttribute("smOrder",smOrder);
        return "Administrator/billListUpdate";
    }

    //修改订单页面
    @RequestMapping("/update")
    public String updateOrder(SmOrder smOrder,String createTime) throws ParseException {
        if(smOrder.getSoUserAddress().equals("")){
            return "Administrator/index-error";
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date sd = sdf.parse(createTime.replaceAll("T"," "));
        smOrder.setSoCreateTime(sd);
        smOrderService.updateTest(smOrder);
        return "Administrator/index-result";
    }

    //删除订单页面
    @RequestMapping("/delete")
    public String deleteOrder(int soId){
        smOrderService.deleteTest(soId);
        return "Administrator/index-result";
    }

    //根据订单号或姓名查找指定的信息
    @RequestMapping("/findByOrder")
    public String successOrder(Model model,
                               @RequestParam(value = "page",defaultValue = "1") Integer page,
                               @RequestParam(value = "pageSize",defaultValue = "5") Integer paseSize,
                               @RequestParam(value = "soId",defaultValue = "0") int soId,
                               @RequestParam(value = "soUserName",defaultValue = "null") String soUserName){
        //查找出ID和姓名的订单信息
        List<SmOrder> smOrders1 = smOrderService.selectSuccess(soId, soUserName,page,paseSize);
        model.addAttribute("smOrders",smOrders1);
        model.addAttribute("page",page);
        model.addAttribute("maxPage",((Page)smOrders1).getPages());

        return "Administrator/billList";
    }


}
