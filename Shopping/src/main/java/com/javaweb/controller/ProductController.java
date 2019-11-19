package com.javaweb.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.javaweb.model.Admin;
import com.javaweb.model.Product;
import com.javaweb.service.ProductService;
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
@RequestMapping("/product")
public class ProductController {
    @Resource
    private ProductService productService;

    @RequestMapping(value="/product")
    public ModelAndView produdct(HttpServletRequest req, HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("product/product");
        return mv;
    }
    @ResponseBody
    @RequestMapping(value="/getList", method= RequestMethod.GET, produces="text/plain;charset=utf-8")
    public String getList(HttpServletRequest req, HttpServletResponse response) {
        List<Product> listproduct = null;
        int count=0;
        try {
            response.setContentType("text/html;charset=utf-8");
            String proId = req.getParameter("proId");
            String cut=req.getParameter("cut");
            String proName=req.getParameter("proName");
            String proRange=req.getParameter("proRange");
            int states= Integer.parseInt(req.getParameter("states"));
            int introduction= Integer.parseInt(req.getParameter("introduction"));
            String start = req.getParameter("start");
            String pageSize = req.getParameter("length");
            if(null==pageSize || pageSize.equals("")) pageSize ="10";
            String orderNum = req.getParameter("order[0][column]");
            String orderData = req.getParameter("columns["+orderNum+"][data]");
            String orderDir = req.getParameter("order[0][dir]");
            String orderSql = " order by " + orderData + " " + orderDir;
            int startIndex = Integer.parseInt(start);
            System.out.println("proId:"+ proId +"proName:"+proName);
            listproduct = productService.queryByConditions(proId,cut,proName,proRange,states,introduction,startIndex,Integer.parseInt(pageSize),orderSql);
            count=productService.countByConditions(proId,cut,proName,proRange,states,introduction);
        } catch (Exception e) {
            e.printStackTrace();
        }
        Map map = new HashMap<String,Object>();
        map.put("data",listproduct);
        map.put("recordsTotal",count);
        map.put("recordsFiltered",count);
        String str= JSON.toJSONString(map, SerializerFeature.WriteMapNullValue);//JSON.toJSONString中序列化空字符串遇到的坑，当某些字段为空时，转换成字符串时必须加SerializerFeature.WriteMapNullValue
        System.out.println(str);
        return str;
    }
}
