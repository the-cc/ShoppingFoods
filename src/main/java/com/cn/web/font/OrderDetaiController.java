package com.cn.web.font;

import com.cn.model.SmOrder;
import com.cn.model.SmProduct;
import com.cn.model.SmProductCategory;
import com.cn.model.SmUser;
import com.cn.service.SmOrderService;
import com.cn.service.SmProductCategoryService;
import com.cn.service.SmProductService;
import com.cn.service.SmUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/OrderDetai")
public class OrderDetaiController {
    @Autowired
    SmProductService smProductService;

    @Autowired
    SmProductCategoryService smProductCategoryService;

    @Autowired
    SmOrderService smOrderService;

    @Autowired
    SmUserService smUserService;

    //展示订单页面
    @RequestMapping("/list")
    public String list(Model model, HttpServletRequest request,
                       @RequestParam(value = "spId",defaultValue = "0") int spId,
                       @RequestParam(value = "sumPrict",defaultValue = "0.0") double sumPrict,
                       @RequestParam(value = "count",defaultValue = "0") int count){
        //导航栏属性
        DHnert(model);
        if(spId >0){ //立即购买展示页面
            SmProduct smProduct = smProductService.selectbyId(spId);
            smProduct.setCount(count);
            model.addAttribute("prodetails",smProduct);
            HttpSession session = request.getSession();
            SmUser lgnUser = (SmUser) session.getAttribute("lgnUser");
            model.addAttribute("user",lgnUser);
            return "order";
        }
        //购物车结算页面
        HttpSession session = request.getSession();
        List<SmProduct> smProducts = (List)session.getAttribute("car");
        SmUser lgnUser = (SmUser) session.getAttribute("lgnUser");
        model.addAttribute("product",smProducts);
        model.addAttribute("sumPrict",sumPrict);
        model.addAttribute("user",lgnUser);
        return "order";
    }

    //生成订单
    @RequestMapping("/generate")
    public String orderForm(Model model, HttpServletRequest request,
                             @RequestParam(value = "spId",defaultValue = "0") int spId,
                             @RequestParam(value = "count",defaultValue = "0") int count){
        if(spId > 0){
            HttpSession session = request.getSession();
            SmUser lgnUser = (SmUser) session.getAttribute("lgnUser");//获取用户信息
            SmProduct smProduct = smProductService.selectbyId(spId);//获取商品信息
            SmOrder smOrder = new SmOrder();
            smOrder.setSoUserName(lgnUser.getSuUserName());
            smOrder.setSoUserAddress(lgnUser.getSuAddress());
            smOrder.setSoName(smProduct.getSpName());
            smOrder.setSoCreateTime(new Date());
            smOrder.setSodQuantity(count);
            smOrder.setSoCost(BigDecimal.valueOf(count*smProduct.getSpPrice().doubleValue()));
            smOrder.setSoStatus(1);
            smOrderService.insertTest(smOrder);//生成订单信息
            smProduct.setSpStock(smProduct.getSpStock()-count);
            smProductService.update(smProduct);//修改商品数量
            model.addAttribute("sumPrict",smOrder.getSoCost());
        }else{         //购物车商品存入订单信息
            HttpSession session = request.getSession();
            SmUser lgnUser = (SmUser) session.getAttribute("lgnUser");//获取用户信息
            List<SmProduct> orderdetai = (List)session.getAttribute("car");//获取订单信息
            for (int i = 0; i < orderdetai.size(); i++) {
                SmProduct smProduct = orderdetai.get(i);
                SmOrder smOrder = new SmOrder();
                smOrder.setSoUserName(lgnUser.getSuUserName());
                smOrder.setSoUserAddress(lgnUser.getSuAddress());
                smOrder.setSoName(smProduct.getSpName());
                smOrder.setSoCreateTime(new Date());
                smOrder.setSodQuantity(smProduct.getCount());
                smOrder.setSoCost(BigDecimal.valueOf(smProduct.getCount()*smProduct.getSpPrice().doubleValue()));
                smOrder.setSoStatus(1);
                SmOrder smOrder1 = smOrderService.selectName(smProduct.getSpName(), lgnUser.getSuUserName());
                smOrderService.insertTest(smOrder);//生成订单信息
                smProduct.setSpStock(smProduct.getSpStock()-smProduct.getCount());
                smProductService.update(smProduct);//修改商品数量
            }
            model.addAttribute("sumPrict",CartController.sum);
            request.getSession().removeAttribute("car");//清楚所有购物车信息
            CartController.sum = 0.0;   //初始化购物车金额
            CartController.orderCount = 0;  //初始化件数
        }

        return "order-success";
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
