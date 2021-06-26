package com.cn.web.font;

import com.cn.model.SmProduct;
import com.cn.model.SmProductCategory;
import com.cn.service.SmProductCategoryService;
import com.cn.service.SmProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private SmProductService smproductService;

    @Autowired
    private SmProductCategoryService smProductCategoryService;

    public static Integer orderCount=0;//选购商品数量

    public static  double sum = 0.0;//总金额



    @RequestMapping("/add")
    public String addCart(Model model,HttpServletRequest request, Integer spId,@RequestParam(value = "tag",defaultValue = "0") Integer tag){
        //1.调用service的根据id查询商品的方法
        SmProduct smProduct = smproductService.selectOne(spId);
        //2.获取购物车（session）
        HttpSession session = request.getSession();
        //3.1 获取购物车中的集合
        List<SmProduct> car = (List) session.getAttribute("car");
        //3.2 集合不存在
        if(car==null) {
            car = new ArrayList<SmProduct>(20);
        }

        double a = 0.0;//价格
        int b = 0;//数量
        boolean flag = true;
        for(int i=0;i<car.size();i++){
            SmProduct carProduct = car.get(i);
            if(carProduct.getSpId().equals(smProduct.getSpId())){
                //此商品已经存在在购物车中了，只要修改改商品的数量 +1
                if(tag==1) {
                    if (carProduct.getCount()<carProduct.getSpStock()){//添加数量大于商品数量，不能添加
                        carProduct.setCount(carProduct.getCount() + 1);
                        a = smProduct.getSpPrice().doubleValue();
                        b = smProduct.getCount();
                        sum += a*b;
                    }
                }
                if(tag==2){
                    if(carProduct.getCount() > 1) {
                        carProduct.setCount(carProduct.getCount() - 1);
                        a = smProduct.getSpPrice().doubleValue();
                        b = smProduct.getCount();
                        sum -= a*b;
                    }
                }
                flag=false;
            }
        }
        //商品不存在在购物车中
        if(flag){
            a = smProduct.getSpPrice().doubleValue();
            b = smProduct.getCount();
            sum += a*b;
            car.add(smProduct);
            orderCount++;

        }
        //3.将集合放入购物车
        session.setAttribute("car",car);//key-value

        if(tag>0){
            return "redirect:shopping";
        }
        //使用重定向
        return "redirect:/details?spId="+spId+"";
    }

    //购物车展示
    @RequestMapping("/shopping")
    public String showCart(Model model){
        //导航栏属性
        DHnert(model);
        //获取分类商品小类
        List<SmProductCategory> small = smProductCategoryService.findSmall();
        model.addAttribute("bigs",small);
        model.addAttribute("orderCount",orderCount);
        model.addAttribute("sumPrict",sum);
        return "shopping_cart";
    }



    @RequestMapping("/delete")
    public String deleteCart(HttpServletRequest request,Integer spId){
        //2.获取购物车（session）
        HttpSession session = request.getSession();
        //3.1 获取购物车中的集合
        List<SmProduct> car = (List) session.getAttribute("car");
        for(int i=0;i<car.size();i++){
            SmProduct carProduct = car.get(i);
            if(carProduct.getSpId().equals(spId)){
                //此商品已经不存在在购物车中，删除
                sum -= carProduct.getSpPrice().doubleValue()*carProduct.getCount().intValue();
                carProduct.setCount(1);
                car.remove(carProduct);
                if(orderCount>0){
                    orderCount--;
                }
                break;
            }
        }
        //使用重定向
        return "redirect:shopping";
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
        List<SmProduct> all = smproductService.findAll();
        model.addAttribute("smproduct",all);
    }

}
