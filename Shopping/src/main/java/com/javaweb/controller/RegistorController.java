package com.javaweb.controller;

import com.javaweb.model.Dep;
import com.javaweb.model.Shop;
import com.javaweb.model.ShopCategory;
import com.javaweb.model.User;
import com.javaweb.service.DepService;
import com.javaweb.service.ShopcutService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/registor")
public class RegistorController {
    @Resource
    private DepService depService;
    @Resource
    private ShopcutService shopcutService;
//    @Resource
//    private UserService userService;
    /**
     * 返回jsp
     */
    @RequestMapping("/user")
    public ModelAndView user(HttpServletRequest req, HttpServletResponse response) throws Exception {
        Date date = new Date();
        System.out.println(date.toString()+":user registor");
        ModelAndView mv=new ModelAndView();
        User user=new User();
        mv.addObject("usermessage",user);
        mv.setViewName("user/adduser");
        return mv;
    }
    @RequestMapping("/shoper")
    public ModelAndView shoper(HttpServletRequest req, HttpServletResponse response) throws Exception {
        Date date = new Date();
        System.out.println(date.toString()+":shoper registor");
        ModelAndView mv=new ModelAndView();
        List<ShopCategory> shopcut = shopcutService.searchAll();
        mv.addObject("shopcategory", shopcut);
        Shop shop=new Shop();
        mv.addObject("shopmessage",shop);
        mv.setViewName("user/addshopper");
        return mv;
    }
    @RequestMapping("/administrator")
    public ModelAndView admininstrator(HttpServletRequest req, HttpServletResponse response) throws Exception {
        Date date = new Date();
        System.out.println(date.toString()+":administrator registor");
        ModelAndView mv=new ModelAndView();
        User user=new User();
        mv.addObject("usermessage",user);
        List<Dep> dep=depService.queryAll();
        mv.addObject("department",dep);
        mv.setViewName("user/addadminstrator");
        return mv;
    }
}
