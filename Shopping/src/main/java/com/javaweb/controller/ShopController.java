package com.javaweb.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.javaweb.model.Shop;
import com.javaweb.model.ShopCategory;
import com.javaweb.service.ShopService;
import com.javaweb.service.ShopcutService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/shop")
public class ShopController {
    @Resource
    private ShopService shopService;
    @Resource
    private ShopcutService shopcutService;
    @RequestMapping(value="/shoppers")
    public ModelAndView shoppers(HttpServletRequest req, HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/shopper");
        return mv;
    }
    @ResponseBody
    @RequestMapping(value="/getshopList", method= RequestMethod.GET, produces="text/plain;charset=utf-8")
    public String getshopList(HttpServletRequest req, HttpServletResponse response) {
        List<Shop> listshop = null;
        int count=0;
        try {
            response.setContentType("text/html;charset=utf-8");
            String shopId = req.getParameter("shopId");
            String shopName=req.getParameter("shopName");
            String start = req.getParameter("start");
            String pageSize = req.getParameter("length");
            if(null==pageSize || pageSize.equals("")) pageSize ="10";
            String orderNum = req.getParameter("order[0][column]");
            String orderData = req.getParameter("columns["+orderNum+"][data]");
            String orderDir = req.getParameter("order[0][dir]");
            String orderSql = " order by " + orderData + " " + orderDir;
            int startIndex = Integer.parseInt(start);
            System.out.println("shopId:"+ shopId );
            System.out.println("shopName"+shopName);
            listshop = shopService.queryByShopConditions(shopId,shopName,startIndex,Integer.parseInt(pageSize),orderSql);
            count=shopService.countByShopConditions(shopId,shopName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        Map map = new HashMap<String,Object>();
        map.put("data",listshop);
        map.put("recordsTotal",count);
        map.put("recordsFiltered",count);
        String str= JSON.toJSONString(map, SerializerFeature.WriteMapNullValue);//JSON.toJSONString中序列化空字符串遇到的坑，当某些字段为空时，转换成字符串时必须加SerializerFeature.WriteMapNullValue
        System.out.println(str);
        return str;
    }
    @RequestMapping("/editshoper")
    public ModelAndView editshoper(HttpServletRequest req, HttpServletResponse response){
        ModelAndView mv = new ModelAndView();
        try{
            String shopId = req.getParameter("shopId");
            System.out.println("shopId:"+ shopId);

            Shop shop = shopService.queryByShopId(shopId);
            mv.addObject("shopmessage", shop);//shopmessage是向前端传递的参数名。这边传的是对象shop，所以对应前端格式：参数名.对象内容（比如shopmessage.shopId)
        }catch (Exception e){
            e.printStackTrace();
        }

        mv.setViewName("user/editshopper");
        return mv;
    }

    @RequestMapping(value="/submitshopEdit", method=RequestMethod.POST)
    @ResponseBody//@ResponsBody的作用是将java 对象转为json格式的数据，可以把具体的数据反馈到前端
    public String submitshopEdit(
            @RequestBody Shop shop
    ) {
        System.out.println("shop.getShopId:"+shop.getShopId());
        try {
            shopService.edit(shop);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "submitEdit success";
    }
    @RequestMapping(value="/deleteshoper", method=RequestMethod.POST)
    @ResponseBody//@ResponsBody的作用是将java 对象转为json格式的数据，可以把具体的数据反馈到前端
    public String deleteshoper(
            @RequestBody Shop shop//传递整个对象时用@RequestBody
    ) {
        System.out.println("shopId:"+shop.getShopId());
        try {
            shopService.deleteByShopId(shop.getShopId());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "删除成功！！！";
    }

    @RequestMapping(value="/shop", method= RequestMethod.POST)
    @ResponseBody
//	@ExceptionHandler(HttpMessageNotReadableException.class)
    public String shop(
            @RequestBody Shop shop//shop是对象，要与model里面的相对应，传递整个对象时用@RequestBody
            , HttpServletResponse response
    ) {

        System.out.println("shopName:"+shop.getShopName());
        try {
            shopService.save(shop);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "test success";
    }
    @RequestMapping(value = "/photo", method = RequestMethod.POST)
    @ResponseBody //不写会默认返回当前路径！！
    public String photo(MultipartFile photo, HttpServletRequest req) throws Exception, IOException {
        //接收文件数据
        System.out.println(photo.getContentType());//  image/jpeg   获取上传文件的类型
        System.out.println(photo.getName());//photo  获取file标签的name属性  <input type="file" name="photo" >
        System.out.println(photo.getOriginalFilename());//1.jpg   获取上传文件的名称

        //把文件对象,以流的方式写出到file的文件夹中
        //动态获取上传文件夹的路径
        ServletContext context = req.getSession().getServletContext();
        String rootPath = "";
        String realpath = rootPath + context.getRealPath("/file");
        //创建保存到服务器的文件的路径，使用时间戳改变文件名，以免重名
        //获取本地存储位置的绝对路径（webapp下的文件）
        String filename = photo.getOriginalFilename();//获取上传时的文件名称
        System.out.println(filename);
        String f = new Date().getTime() + "." + FilenameUtils.getExtension(filename);
//        String path= realpath +"/"+ new Date().getTime() + photo.getOriginalFilename();
        File newFile = new File(realpath, f);
        photo.transferTo(newFile);
        return "上传成功";
    }
    @RequestMapping(value = "/sendParams", method = RequestMethod.POST)
    public ModelAndView sendParams(HttpServletRequest req, HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        try {

            String shopName = req.getParameter("shopName");
            String tel = req.getParameter("tel");
            System.out.println("shopName:" + shopName + "tel:" + tel);
            Shop resultshop = shopService.queryByShopName(shopName);
            System.out.println("resultshop" + resultshop.getTel());
            if (!resultshop.getTel().equals(tel) ) {//tel是字符串类型，判断取值是否相等用equals()
                mv.setViewName("incorrect");
            }
            if(resultshop.getTel().equals(tel)){
                mv.addObject("shopmessage",resultshop);
                mv.setViewName("index/shopindex");  //此方法只能返回.jsp界面，若想返回html可以把HTML文件转换成.jsp文件
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return mv;
    }
    @RequestMapping(value = "/revertAllshopcut")
    public ModelAndView Listshopcut(HttpServletRequest req, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        List<ShopCategory> listshopcut = null;
        try {
            String shopcutId = req.getParameter("shopcutId");
            System.out.println("shopcutId:" + shopcutId);
            listshopcut = shopcutService.searchByShopcutId(shopcutId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        mv.addObject("shopcategory", listshopcut);
        mv.setViewName("shopcategory/shopcategory");//通过model.addAttribute向前端传入数据
        return mv;

    }
    @RequestMapping("/addshopcut")
    public ModelAndView addshopcut(HttpServletRequest req, HttpServletResponse response) throws Exception {
        Date date = new Date();
        System.out.println(date.toString() + ":add shopcategory");
        ModelAndView mv = new ModelAndView();
        List<ShopCategory> shopcategory = shopcutService.searchAll();
        mv.addObject("shopcut", shopcategory);
        mv.setViewName("shopcategory/addshopcategory");
        return mv;
    }
    @RequestMapping(value = "/addshopcategory", method = RequestMethod.POST)
    @ResponseBody
    public String addshopcategory(
            @RequestBody ShopCategory shopcut//shopcategory是对象，要与model里面的相对应，传递整个对象时用@RequestBody
            , HttpServletResponse response
    ) {

        System.out.println("shopcut:" + shopcut.getShopcut());
        try {

            shopcutService.save(shopcut);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "test success";
    }
    @RequestMapping("/editShopcut")
    public ModelAndView editShopcut(HttpServletRequest req, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        try {
            String shopcutId = req.getParameter("shopcutId");
            System.out.println("shopcutId:" + shopcutId);

            ShopCategory shopcut = shopcutService.queryByShopcutId(shopcutId);
            List<ShopCategory> shopcategory = shopcutService.searchAll();
            mv.addObject("shopcut", shopcategory);
            mv.addObject("shopcategory", shopcut);
        } catch (Exception e) {
            e.printStackTrace();
        }

        mv.setViewName("shopcategory/editshopcategory");
        return mv;
    }
    @RequestMapping(value = "/submitshopcutEdit", method = RequestMethod.POST)
    @ResponseBody//@ResponsBody的作用是将java 对象转为json格式的数据，可以把具体的数据反馈到前端
    public String submitshopcutEdit(
            @RequestBody ShopCategory shopCategory
    ) {
        System.out.println("shopcategory.getShopcutId:" + shopCategory.getShopcutId());
        try {
            shopcutService.edit(shopCategory);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "submitEdit success";
    }
    @RequestMapping(value = "/deleteShopcut", method = RequestMethod.POST)
    @ResponseBody//@ResponsBody的作用是将java 对象转为json格式的数据，可以把具体的数据反馈到前端
    public String deleteShopcut(
            @RequestBody ShopCategory shopCategory//传递整个对象时用@RequestBody
    ) {
        System.out.println("shopcutId:" + shopCategory.getShopcutId());
        try {
            shopcutService.deleteByShopcutId(shopCategory.getShopcutId());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "删除成功！！！";
    }
    @RequestMapping("/shopmessage")
    public ModelAndView shopmessage(HttpServletRequest req, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        try{
            String shopName = req.getParameter("shopName");
            System.out.println("shopName:"+ shopName);

            Shop shop = shopService.queryByShopName(shopName);
            mv.addObject("shopmessage", shop);//shopmessage是向前端传递的参数名。这边传的是对象worker，所以对应前端格式：参数名.对象内容（比如workermessage.workerId)
        }catch (Exception e){
            e.printStackTrace();
        }
        mv.setViewName("user/editshopper");
        return mv;
    }

}
