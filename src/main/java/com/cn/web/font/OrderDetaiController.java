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

    //չʾ����ҳ��
    @RequestMapping("/list")
    public String list(Model model, HttpServletRequest request,
                       @RequestParam(value = "spId",defaultValue = "0") int spId,
                       @RequestParam(value = "sumPrict",defaultValue = "0.0") double sumPrict,
                       @RequestParam(value = "count",defaultValue = "0") int count){
        //����������
        DHnert(model);
        if(spId >0){ //��������չʾҳ��
            SmProduct smProduct = smProductService.selectbyId(spId);
            smProduct.setCount(count);
            model.addAttribute("prodetails",smProduct);
            HttpSession session = request.getSession();
            SmUser lgnUser = (SmUser) session.getAttribute("lgnUser");
            model.addAttribute("user",lgnUser);
            return "order";
        }
        //���ﳵ����ҳ��
        HttpSession session = request.getSession();
        List<SmProduct> smProducts = (List)session.getAttribute("car");
        SmUser lgnUser = (SmUser) session.getAttribute("lgnUser");
        model.addAttribute("product",smProducts);
        model.addAttribute("sumPrict",sumPrict);
        model.addAttribute("user",lgnUser);
        return "order";
    }

    //���ɶ���
    @RequestMapping("/generate")
    public String orderForm(Model model, HttpServletRequest request,
                             @RequestParam(value = "spId",defaultValue = "0") int spId,
                             @RequestParam(value = "count",defaultValue = "0") int count){
        if(spId > 0){
            HttpSession session = request.getSession();
            SmUser lgnUser = (SmUser) session.getAttribute("lgnUser");//��ȡ�û���Ϣ
            SmProduct smProduct = smProductService.selectbyId(spId);//��ȡ��Ʒ��Ϣ
            SmOrder smOrder = new SmOrder();
            smOrder.setSoUserName(lgnUser.getSuUserName());
            smOrder.setSoUserAddress(lgnUser.getSuAddress());
            smOrder.setSoName(smProduct.getSpName());
            smOrder.setSoCreateTime(new Date());
            smOrder.setSodQuantity(count);
            smOrder.setSoCost(BigDecimal.valueOf(count*smProduct.getSpPrice().doubleValue()));
            smOrder.setSoStatus(1);
            smOrderService.insertTest(smOrder);//���ɶ�����Ϣ
            smProduct.setSpStock(smProduct.getSpStock()-count);
            smProductService.update(smProduct);//�޸���Ʒ����
            model.addAttribute("sumPrict",smOrder.getSoCost());
        }else{         //���ﳵ��Ʒ���붩����Ϣ
            HttpSession session = request.getSession();
            SmUser lgnUser = (SmUser) session.getAttribute("lgnUser");//��ȡ�û���Ϣ
            List<SmProduct> orderdetai = (List)session.getAttribute("car");//��ȡ������Ϣ
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
                smOrderService.insertTest(smOrder);//���ɶ�����Ϣ
                smProduct.setSpStock(smProduct.getSpStock()-smProduct.getCount());
                smProductService.update(smProduct);//�޸���Ʒ����
            }
            model.addAttribute("sumPrict",CartController.sum);
            request.getSession().removeAttribute("car");//������й��ﳵ��Ϣ
            CartController.sum = 0.0;   //��ʼ�����ﳵ���
            CartController.orderCount = 0;  //��ʼ������
        }

        return "order-success";
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
