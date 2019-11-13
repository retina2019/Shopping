package com.javaweb.controller;

import com.javaweb.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

@Controller
@RequestMapping("/registor")
public class RegistorController {
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
    public ModelAndView shopper(HttpServletRequest req, HttpServletResponse response) throws Exception {
        Date date = new Date();
        System.out.println(date.toString()+":user registor");
        ModelAndView mv=new ModelAndView();
        User user=new User();
        mv.addObject("usermessage",user);
        mv.setViewName("user/addshopper");
        return mv;
    }
}
