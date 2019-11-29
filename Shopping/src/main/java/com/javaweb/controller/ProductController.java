package com.javaweb.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.javaweb.model.Category;
import com.javaweb.model.Product;
import com.javaweb.service.CutService;
import com.javaweb.service.ProductService;
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
@RequestMapping("/product")
public class ProductController {
    @Resource
    private ProductService productService;
    @Resource
    private CutService cutService;

    @RequestMapping(value = "/product")
    public ModelAndView product(HttpServletRequest req, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("product/product");
        return mv;
    }
 //前端分页
    @ResponseBody
    @RequestMapping(value="/getList",method= RequestMethod.GET, produces="text/plain;charset=utf-8")
    public String getList(HttpServletRequest req, HttpServletResponse response) {
        List<Product> listproduct = null;
        int count=0;
        try {
            response.setContentType("text/html;charset=utf-8");
            String proId = req.getParameter("proId");
            String cut=req.getParameter("cut");
            int state= Integer.parseInt(req.getParameter("state"));
            String start = req.getParameter("start");
            String pageSize = req.getParameter("length");
            if(null==pageSize || pageSize.equals("")) pageSize ="10";
            String orderNum = req.getParameter("order[0][column]");
            String orderData = req.getParameter("columns["+orderNum+"][data]");
            String orderDir = req.getParameter("order[0][dir]");
            String orderSql = " order by " + orderData + " " + orderDir;
            int startIndex = Integer.parseInt(start);
            listproduct=productService.queryByConditions(proId,cut,state,startIndex,Integer.parseInt(pageSize),orderSql);
            count=productService.countByConditions(proId,cut,state);
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

@RequestMapping(value="/addProduct")
public ModelAndView addProduct(HttpServletRequest req, HttpServletResponse response) throws Exception {
    Date date = new Date();
    System.out.println(date.toString()+":add product");
    ModelAndView mv=new ModelAndView();
    List<Category> cut=cutService.searchAll();
    mv.addObject("category",cut);
    mv.setViewName("product/addproduct");
    return mv;
}

    @RequestMapping(value="/addProductMessage", method= RequestMethod.POST)
    @ResponseBody
    public String addProductMessage(
            @RequestBody Product product//product是对象，要与model里面的相对应，传递整个对象时用@RequestBody
            , HttpServletResponse response
    ) {

        System.out.println("proName:"+product.getProName());
        try {

            productService.save(product);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "test success";
    }
    @RequestMapping(value="/revertAllcut")
    public ModelAndView Listcut(HttpServletRequest req, HttpServletResponse response ) {
        ModelAndView mv = new ModelAndView();
        List<Category> listcut = null;
        try {
            String cutId = req.getParameter("cutId");
            System.out.println("cutId:"+ cutId);
            listcut = cutService.searchByCutId(cutId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        mv.addObject("category",listcut);
        mv.setViewName("category/category");//通过model.addAttribute向前端传入数据
        return mv;

    }
    @RequestMapping("/addCut")
    public ModelAndView addCut(HttpServletRequest req, HttpServletResponse response) throws Exception {
        Date date = new Date();
        System.out.println(date.toString()+":add category");
        ModelAndView mv=new ModelAndView();
        List<Category> category=cutService.searchAll();
        mv.addObject("cut",category);
        mv.setViewName("category/addcategory");
        return mv;
    }
    @RequestMapping(value="/addcategory", method= RequestMethod.POST)
    @ResponseBody
    public String addcategory(
            @RequestBody Category cut//category是对象，要与model里面的相对应，传递整个对象时用@RequestBody
            , HttpServletResponse response
    ) {

        System.out.println("cut:"+cut.getCut());
        try {

            cutService.save(cut);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "test success";
    }
    @RequestMapping("/editCut")
    public ModelAndView editCut(HttpServletRequest req, HttpServletResponse response){
        ModelAndView mv = new ModelAndView();
        try{
            String cutId = req.getParameter("cutId");
            System.out.println("cutId:"+ cutId);

            Category cut = cutService.queryByCutId(cutId);
            mv.addObject("category", cut);
        }catch (Exception e){
            e.printStackTrace();
        }

        mv.setViewName("category/editcategory");
        return mv;
    }
    @RequestMapping(value="/submitcutEdit", method=RequestMethod.POST)
    @ResponseBody//@ResponsBody的作用是将java 对象转为json格式的数据，可以把具体的数据反馈到前端
    public String submitcutEdit(
            @RequestBody Category cut
    ) {
        System.out.println("category.getCutId:"+cut.getCutId());
        try {
            cutService.edit(cut);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "submitEdit success";
    }
    @RequestMapping(value="/deleteCut", method=RequestMethod.POST)
    @ResponseBody//@ResponsBody的作用是将java 对象转为json格式的数据，可以把具体的数据反馈到前端
    public String deleteCut(
            @RequestBody Category cut//传递整个对象时用@RequestBody
    ) {
        System.out.println("cutId:"+cut.getCutId());
        try {
            cutService.deleteByCutId(cut.getCutId());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "删除成功！！！";
    }

    @RequestMapping("/editProduct")
    public ModelAndView editProduct(HttpServletRequest req, HttpServletResponse response){
        ModelAndView mv = new ModelAndView();
        try{
            String proId = req.getParameter("proId");
            System.out.println("proId:"+ proId);

            Product product=productService.queryByproId(proId);
            List<Category> cut=cutService.searchAll();
            mv.addObject("category",cut);
            mv.addObject("product",product);
        }catch (Exception e){
            e.printStackTrace();
        }

        mv.setViewName("product/editproduct");
        return mv;
    }
    @RequestMapping(value="/submitProductEdit", method=RequestMethod.POST)
    @ResponseBody//@ResponsBody的作用是将java 对象转为json格式的数据，可以把具体的数据反馈到前端
    public String submitProductEdit(
            @RequestBody Product product
    ) {
        System.out.println("product.getProId:"+product.getProId());
        try {
            productService.edit(product);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "submitEdit success";
    }
    @RequestMapping(value="/deleteProduct", method=RequestMethod.POST)
    @ResponseBody//@ResponsBody的作用是将java 对象转为json格式的数据，可以把具体的数据反馈到前端
    public String deleteProduct(
            @RequestBody Product product//传递整个对象时用@RequestBody
    ) {
        System.out.println("deletebyproId:"+product.getProId());
        try {
            productService.deleteByProId(product.getProId());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "删除成功！！！";
    }
}
