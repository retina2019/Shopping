package com.javaweb.controller;

import com.javaweb.model.User;
import com.javaweb.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/javauser")
public class JavauserController {
    @Resource
    UserService userService;

    @RequestMapping(value = "/sendParams", method = RequestMethod.POST)
    public ModelAndView sendParams(HttpServletRequest req, HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        try {

            String userName = req.getParameter("userName");
            String password = req.getParameter("password");
            System.out.println("userName:" + userName + "password:" + password);
            User resultuser = userService.queryByUserName(userName);
            System.out.println("resultuser" + resultuser.getPassword());
            if (!resultuser.getPassword().equals(password)) {//password是字符串类型，判断取值是否相等用equals()
                mv.setViewName("incorrect");
            }
            if (resultuser.getPassword().equals(password)) {
                mv.addObject("usermessage", resultuser);
                mv.setViewName("index/javauserindex");  //此方法只能返回.jsp界面，若想返回html可以把HTML文件转换成.jsp文件
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return mv;
    }
    @RequestMapping("/usermessage")
    public ModelAndView usermessage(HttpServletRequest req, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        try{
            String userName = req.getParameter("userName");
            System.out.println("userName:"+ userName);

            User user = userService.queryByUserName(userName);
            mv.addObject("usermessage", user);//usermessage是向前端传递的参数名。这边传的是对象worker，所以对应前端格式：参数名.对象内容（比如workermessage.workerId)
        }catch (Exception e){
            e.printStackTrace();
        }
        mv.setViewName("user/edituser");
        return mv;
    }

}
