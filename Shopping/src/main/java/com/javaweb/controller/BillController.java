package com.javaweb.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.javaweb.model.Bill;
import com.javaweb.service.BillService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/bills")
public class BillController {
    @Resource
    private BillService billService;
    @RequestMapping(value="/bill")
    public ModelAndView bill(HttpServletRequest req, HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("financial/bill");
        return mv;
    }
    @ResponseBody
    @RequestMapping(value="/getList", method= RequestMethod.GET, produces="text/plain;charset=utf-8")
    public String getList( HttpServletRequest req, HttpServletResponse response
    ) {
        List<Bill> listbill = null;
        int count=0;
        try {
            response.setContentType("text/html;charset=utf-8");
            String orderId = req.getParameter("orderId");
            String companyName=req.getParameter("companyName");
            String tfn=req.getParameter("tfn");
            String items=req.getParameter("items");
            String remarks=req.getParameter("remarks");
            String userId=req.getParameter("userId");
            int state= Integer.parseInt(req.getParameter("state"));
            String applytimebegin=req.getParameter("applytimebegin");
            String applytimeend=req.getParameter("applytimeend");

            String start = req.getParameter("start");
            String pageSize = req.getParameter("length");
            if(null==pageSize || pageSize.equals("")) pageSize ="10";

            String orderNum = req.getParameter("order[0][column]");
            String orderData = req.getParameter("columns["+orderNum+"][data]");
            String orderDir = req.getParameter("order[0][dir]");
            String orderSql = " order by " + orderData + " " + orderDir;


            int startIndex = Integer.parseInt(start);

            System.out.println("orderId:"+ orderId );
            listbill = billService.queryByConditions(orderId,companyName,tfn,items,remarks,userId,state,applytimebegin,applytimeend,startIndex,Integer.parseInt(pageSize),orderSql);
            count=billService.countByConditions(orderId,companyName,tfn,items,remarks,userId,state,applytimebegin,applytimeend);
        } catch (Exception e) {
            e.printStackTrace();
        }
        Map map = new HashMap<String,Object>();
        map.put("data",listbill);
        map.put("recordsTotal",count);
        map.put("recordsFiltered",count);
        //map.put("draw",7);

        String str= JSON.toJSONString(map, SerializerFeature.WriteMapNullValue);
        System.out.println(str);

        return str;

    }
    @RequestMapping(value = "/addBill")
    public ModelAndView addBill(HttpServletRequest req, HttpServletResponse response) throws Exception {
        Date date = new Date();
        System.out.println(date.toString() + ":add bill");
        ModelAndView mv = new ModelAndView();

        mv.setViewName("financial/addbill");
        return mv;
    }
    @RequestMapping(value = "/addBillMessage", method = RequestMethod.POST)
    @ResponseBody
    public String addBillMessage(
            @RequestBody Bill bill//bill是对象，要与model里面的相对应，传递整个对象时用@RequestBody
            , HttpServletResponse response
    ) {

        System.out.println("orderId:" + bill.getOrderId());
        try {

            billService.save(bill);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "test success";
    }
    @RequestMapping("/editBill")
    public ModelAndView editBill(HttpServletRequest req, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        try {
            String orderId = req.getParameter("orderId");
            System.out.println("orderId:" + orderId);

            Bill bill = billService.queryByOrderId(orderId);

            mv.addObject("bill",bill);
        } catch (Exception e) {
            e.printStackTrace();
        }

        mv.setViewName("financial/editbill");
        return mv;
    }
    @RequestMapping(value = "/submitBillEdit", method = RequestMethod.POST)
    @ResponseBody//@ResponsBody的作用是将java 对象转为json格式的数据，可以把具体的数据反馈到前端
    public String submitBillEdit(
            @RequestBody Bill bill
    ) {
        System.out.println("bill.getOrderId:" + bill.getOrderId());
        try {
            billService.edit(bill);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "submitEdit success";
    }
    @RequestMapping(value = "/deleteBill", method = RequestMethod.POST)
    @ResponseBody//@ResponsBody的作用是将java 对象转为json格式的数据，可以把具体的数据反馈到前端
    public String deleteBill(
            @RequestBody Bill bill//传递整个对象时用@RequestBody
    ) {
        System.out.println("deleteByOrderId:" + bill .getOrderId());
        try {
            billService.deleteByOrderId(bill.getOrderId());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "删除成功！！！";
    }

}
