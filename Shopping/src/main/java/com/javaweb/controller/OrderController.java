package com.javaweb.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.javaweb.model.Order;
import com.javaweb.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/orders")
public class OrderController {
    @Resource
    private OrderService orderService;
    @RequestMapping(value="/order")
    public ModelAndView order(HttpServletRequest req, HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("orders/order");
        return mv;
    }
    @ResponseBody
    @RequestMapping(value="/getList", method= RequestMethod.GET, produces="text/plain;charset=utf-8")
    public String getList( HttpServletRequest req, HttpServletResponse response
    ) {

        List<Order> listorder = null;
        int count=0;
        try {
            response.setContentType("text/html;charset=utf-8");
            String tel = req.getParameter("tel");
            int userId= Integer.parseInt(req.getParameter("userId"));
            String userName=req.getParameter("userName");
            String orderId=req.getParameter("orderId");
            String payNo=req.getParameter("payNo");
            String verification=req.getParameter("verification");
            String proId=req.getParameter("proId");
            String proName=req.getParameter("proName");
            String expand=req.getParameter("expand");
            int state= Integer.parseInt(req.getParameter("state"));
            String transbegin=req.getParameter("transbegin");
            String transend=req.getParameter("transend");
            String updatebegin=req.getParameter("updatebegin");
            String updateend=req.getParameter("updateend");

            String start = req.getParameter("start");
            String pageSize = req.getParameter("length");
            if(null==pageSize || pageSize.equals("")) pageSize ="10";

            String orderNum = req.getParameter("order[0][column]");
            String orderData = req.getParameter("columns["+orderNum+"][data]");
            String orderDir = req.getParameter("order[0][dir]");
            String orderSql = " order by " + orderData + " " + orderDir;


            int startIndex = Integer.parseInt(start);

            System.out.println("orderId:"+ orderId );
            listorder = orderService.queryByConditions(tel,userId,userName,orderId,payNo,verification,proId,proName,expand,state,transbegin,transend,updatebegin,updateend,startIndex,Integer.parseInt(pageSize),orderSql);
            count=orderService.countByConditions(tel,userId,userName,orderId,payNo,verification,proId,proName,expand,state,transbegin,transend,updatebegin,updateend);
        } catch (Exception e) {
            e.printStackTrace();
        }
        Map map = new HashMap<String,Object>();
        map.put("data",listorder);
        map.put("recordsTotal",count);
        map.put("recordsFiltered",count);
        //map.put("draw",7);

        String str= JSON.toJSONString(map, SerializerFeature.WriteMapNullValue);
        System.out.println(str);

        return str;

    }
}
