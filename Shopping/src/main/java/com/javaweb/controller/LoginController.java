package com.javaweb.controller;


import com.javaweb.model.Shop;
import com.javaweb.model.User;
import com.javaweb.service.ShopService;
import com.javaweb.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.Date;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Resource
    private UserService userService;
    @Resource
    private ShopService shopService;

    /**
     * 返回jsp
     *
     * @param response
     */
    @RequestMapping("/getJSP")
    public ModelAndView getJSP(HttpServletRequest req, HttpServletResponse response) {

        Date date = new Date();
        System.out.println(date.toString() + ":getJSP");
        try {
            String str = "";
            if (req.getParameter("userName") != null) {
                str = new String(req.getParameter("userName").getBytes("ISO-8859-1"), "UTF-8");
            }
            System.out.println("=====" + str);

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        ModelAndView mv = new ModelAndView();

        mv.setViewName("login/login");
        return mv;
    }

    @RequestMapping(value = "/sendParams", method = RequestMethod.POST)
    public ModelAndView sendParams(HttpServletRequest req, HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        try {

            String userName = req.getParameter("userName");
            String password = req.getParameter("password");
            System.out.println("userName:" + userName + "password:" + password);
            User resultuser = userService.queryByUserName(userName);
            System.out.println("resultuser" + resultuser.getPassword());
            if (!resultuser.getPassword().equals(password) ) {//password是字符串类型，判断取值是否相等用equals()
               mv.setViewName("incorrect");
            }
            if(resultuser.getPassword().equals(password)){
                mv.setViewName("index/adminindex");  //此方法只能返回.jsp界面，若想返回html可以把HTML文件转换成.jsp文件
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return mv;
    }


    @RequestMapping("/shop")
    public ModelAndView shop(HttpServletRequest req, HttpServletResponse response)throws Exception{
        ModelAndView mv=new ModelAndView();
        mv.setViewName("login/shoplogin");
        return mv;
    }
    @RequestMapping("/javauser")
    public ModelAndView javauser(HttpServletRequest req, HttpServletResponse response)throws Exception{
        ModelAndView mv=new ModelAndView();
        mv.setViewName("login/javauserlogin");
        return mv;
    }
//    @ResponseBody
//    @RequestMapping(value = "/loginshop")
//    public ModelAndView loginshop(HttpServletRequest req, HttpServletResponse response) {
//
//        ModelAndView mv = new ModelAndView();
//
//        try {
//            String shopName = req.getParameter("shopName");
//            System.out.println("shopName=" + shopName);
////            Shop resultshop = shopService.queryByShopName(shopName);
////            System.out.println("resultshop:" + resultshop.getShopName());
////            if (resultshop.getShopName().equals(shopName)) {
////                mv.setViewName("login/adminindex");
////            }
////            if (!resultshop.getShopName().equals(shopName)) {
////                mv.setViewName("incorrect");
////            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        mv.setViewName("login/adminindex");
//        return mv;
//    }
//    @RequestMapping("/shoplogin")
//    public ModelAndView shoplogin(HttpServletRequest req, HttpServletResponse response) throws Exception {
//
//        ModelAndView mv=new ModelAndView();
//        try {
//            String shopName = req.getParameter("shopName");
//            System.out.println("shopName=" + shopName);
//            Shop resultshop = shopService.queryByShopName(shopName);
//            System.out.print("resultshop=" + resultshop.getShopName());
//            if(!resultshop.getShopName().equals(shopName)){
//                mv.setViewName("incorrect");
//            }
//            if(resultshop.getShopName().equals(shopName)){
//                mv.setViewName("login/adminindex");
//            }
//        }catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return mv;
//    }
}
