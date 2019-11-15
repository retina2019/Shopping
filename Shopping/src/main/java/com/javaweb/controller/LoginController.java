package com.javaweb.controller;

import com.javaweb.model.User;
import com.javaweb.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Resource
    private UserService userService;

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
            System.out.println("resultUser" + resultuser.getPassword());
            if (!resultuser.getPassword().equals(password) ) {//password是字符串类型，判断取值是否相等用equals()
               mv.setViewName("incorrect");
            }
            if(resultuser.getPassword().equals(password)){
                mv.setViewName("login/index");  //此方法只能返回.jsp界面，若想返回html可以把HTML文件转换成.jsp文件
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return mv;
    }
}
