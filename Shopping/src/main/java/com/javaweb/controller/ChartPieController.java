package com.javaweb.controller;

import com.alibaba.fastjson.JSONObject;
import com.javaweb.model.ChartPie;
import com.javaweb.model.Product;
import com.javaweb.service.ChartPieService;
import com.javaweb.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/echarts")

public class ChartPieController {
    @Resource//@Resource的作用是会自动加载ChartPieService,实际调用的是ChartPieServiceImpl
    private ChartPieService chartPieService;
    @Resource
    private ProductService productService;

    /**
     * 返回jsp
     */
//    private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    @RequestMapping(value = "/echart")//返回主界面
    public ModelAndView assess(HttpServletRequest req, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("statistics/chartpie");
        List<ChartPie> list = new ArrayList<ChartPie>();
        try {
            response.setContentType("text/html;charset=utf-8");
            list = chartPieService.sumTotal();
            String listStr = JSONObject.toJSONString(list);
            mv.addObject("dataArr", listStr);
            List<Product> listName= productService.queryAll();
            String listPro=JSONObject.toJSONString(listName);
            mv.addObject("cutId",listPro);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mv;
    }
}
