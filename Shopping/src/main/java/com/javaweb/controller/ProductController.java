package com.javaweb.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.javaweb.model.Category;
import com.javaweb.model.Product;
import com.javaweb.service.CutService;
import com.javaweb.service.ExcelService;
import com.javaweb.service.ProductService;
import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.*;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Resource
    private ProductService productService;
    @Resource
    private CutService cutService;
    @Resource
    private ExcelService excelService;

    @RequestMapping(value = "/product")
    public ModelAndView product(HttpServletRequest req, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("product/product");
        return mv;
    }

    //前端分页
    @ResponseBody
    @RequestMapping(value = "/getList", method = RequestMethod.GET, produces = "text/plain;charset=utf-8")
    public String getList(HttpServletRequest req, HttpServletResponse response) {
        List<Product> listproduct = null;
        int count = 0;
        try {
            response.setContentType("text/html;charset=utf-8");
            String proId = req.getParameter("proId");
            String cutId = req.getParameter("cutId");
            int state = Integer.parseInt(req.getParameter("state"));
            String start = req.getParameter("start");
            String pageSize = req.getParameter("length");
            if (null == pageSize || pageSize.equals("")) pageSize = "10";
            String orderNum = req.getParameter("order[0][column]");
            String orderData = req.getParameter("columns[" + orderNum + "][data]");
            String orderDir = req.getParameter("order[0][dir]");
            String orderSql = " order by " + orderData + " " + orderDir;
            int startIndex = Integer.parseInt(start);
            listproduct = productService.queryByConditions(proId, cutId, state, startIndex, Integer.parseInt(pageSize), orderSql);
            count = productService.countByConditions(proId, cutId, state);
        } catch (Exception e) {
            e.printStackTrace();
        }
        Map map = new HashMap<String, Object>();
        map.put("data", listproduct);
        map.put("recordsTotal", count);
        map.put("recordsFiltered", count);
        String str = JSON.toJSONString(map, SerializerFeature.WriteMapNullValue);//JSON.toJSONString中序列化空字符串遇到的坑，当某些字段为空时，转换成字符串时必须加SerializerFeature.WriteMapNullValue
        System.out.println(str);
        return str;
    }

    @RequestMapping(value = "/addProduct")
    public ModelAndView addProduct(HttpServletRequest req, HttpServletResponse response) throws Exception {
        Date date = new Date();
        System.out.println(date.toString() + ":add product");
        ModelAndView mv = new ModelAndView();
        List<Category> cut = cutService.searchAll();
        mv.addObject("category", cut);
        mv.setViewName("product/addproduct");
        return mv;
    }

    @RequestMapping(value = "/addProductMessage", method = RequestMethod.POST)
    @ResponseBody
    public String addProductMessage(
            @RequestBody Product product//product是对象，要与model里面的相对应，传递整个对象时用@RequestBody
            , HttpServletResponse response
    ) {

        System.out.println("proName:" + product.getProName());
        try {

            productService.save(product);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "test success";
    }

    @RequestMapping(value = "/revertAllcut")
    public ModelAndView Listcut(HttpServletRequest req, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        List<Category> listcut = null;
        try {
            String cutId = req.getParameter("cutId");
            System.out.println("cutId:" + cutId);
            listcut = cutService.searchByCutId(cutId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        mv.addObject("category", listcut);
        mv.setViewName("category/category");//通过model.addAttribute向前端传入数据
        return mv;

    }

    @RequestMapping("/addCut")
    public ModelAndView addCut(HttpServletRequest req, HttpServletResponse response) throws Exception {
        Date date = new Date();
        System.out.println(date.toString() + ":add category");
        ModelAndView mv = new ModelAndView();
        List<Category> category = cutService.searchAll();
        mv.addObject("cut", category);
        mv.setViewName("category/addcategory");
        return mv;
    }

    @RequestMapping(value = "/addcategory", method = RequestMethod.POST)
    @ResponseBody
    public String addcategory(
            @RequestBody Category cut//category是对象，要与model里面的相对应，传递整个对象时用@RequestBody
            , HttpServletResponse response
    ) {

        System.out.println("cut:" + cut.getCut());
        try {

            cutService.save(cut);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "test success";
    }

    @RequestMapping("/editCut")
    public ModelAndView editCut(HttpServletRequest req, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        try {
            String cutId = req.getParameter("cutId");
            System.out.println("cutId:" + cutId);

            Category cut = cutService.queryByCutId(cutId);
            mv.addObject("category", cut);
        } catch (Exception e) {
            e.printStackTrace();
        }

        mv.setViewName("category/editcategory");
        return mv;
    }

    @RequestMapping(value = "/submitcutEdit", method = RequestMethod.POST)
    @ResponseBody//@ResponsBody的作用是将java 对象转为json格式的数据，可以把具体的数据反馈到前端
    public String submitcutEdit(
            @RequestBody Category cut
    ) {
        System.out.println("category.getCutId:" + cut.getCutId());
        try {
            cutService.edit(cut);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "submitEdit success";
    }

    @RequestMapping(value = "/deleteCut", method = RequestMethod.POST)
    @ResponseBody//@ResponsBody的作用是将java 对象转为json格式的数据，可以把具体的数据反馈到前端
    public String deleteCut(
            @RequestBody Category cut//传递整个对象时用@RequestBody
    ) {
        System.out.println("cutId:" + cut.getCutId());
        try {
            cutService.deleteByCutId(cut.getCutId());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "删除成功！！！";
    }

    @RequestMapping("/editProduct")
    public ModelAndView editProduct(HttpServletRequest req, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        try {
            String proId = req.getParameter("proId");
            System.out.println("proId:" + proId);

            Product product = productService.queryByproId(proId);
            List<Category> cut = cutService.searchAll();
            mv.addObject("category", cut);
            mv.addObject("product", product);
        } catch (Exception e) {
            e.printStackTrace();
        }

        mv.setViewName("product/editproduct");
        return mv;
    }

    @RequestMapping(value = "/submitProductEdit", method = RequestMethod.POST)
    @ResponseBody//@ResponsBody的作用是将java 对象转为json格式的数据，可以把具体的数据反馈到前端
    public String submitProductEdit(
            @RequestBody Product product
    ) {
        System.out.println("product.getProId:" + product.getProId());
        try {
            productService.edit(product);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "submitEdit success";
    }

    @RequestMapping(value = "/deleteProduct", method = RequestMethod.POST)
    @ResponseBody//@ResponsBody的作用是将java 对象转为json格式的数据，可以把具体的数据反馈到前端
    public String deleteProduct(
            @RequestBody Product product//传递整个对象时用@RequestBody
    ) {
        System.out.println("deletebyproId:" + product.getProId());
        try {
            productService.deleteByProId(product.getProId());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "删除成功！！！";
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


    @RequestMapping(value = "/download_excel1")

//获取url链接上的参数
    public @ResponseBody
    String download(HttpServletResponse response, @RequestParam("proId") String proId, @RequestParam("name") String name) {
        response.setContentType("application/binary;charset=UTF-8");
        try {
            ServletOutputStream out = response.getOutputStream();
            try {

                //设置文件头：最后一个参数是设置下载文件名(这里我们叫：张三.pdf)
                response.setHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode(name + ".xls", "UTF-8"));
            } catch (UnsupportedEncodingException e1) {
                e1.printStackTrace();
            }
//            String proId = req.getParameter("proId");
//            String cutId=req.getParameter("cutId");
//            int state= Integer.parseInt(req.getParameter("state"));
//            List<Product> listproduct = null;
//            listproduct=excelService.searchByConditions(proId,cutId,state);
            String[] titles = {"proId", "cutId", "proName", "logistical", "state", "photo", "introduction", "price", "scale", "quantity"};
            excelService.export(titles, out);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "导出信息失败";
        }
    }

    @RequestMapping(value = "/download_excel2")
    public @ResponseBody
    String download2(HttpServletRequest req, HttpServletResponse response, @RequestParam("proId") String proId, @RequestParam("name") String name) {
        response.setContentType("application/binary;charset=UTF-8");
        try {
            ServletOutputStream out = response.getOutputStream();
            //设置文件头：最后一个参数是设置下载文件名(这里我们叫：商品信息表.xls)
            response.setHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode(name + ".xls", "UTF-8"));
            String[] titles = {"proId", "cutId", "proName", "logistical", "state", "photo", "introduction", "price", "scale", "quantity"};
            try {
                // 第一步，创建一个workbook，对应一个Excel文件
                HSSFWorkbook workbook = new HSSFWorkbook();

                // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
                HSSFSheet hssfSheet = workbook.createSheet("商品信息表");

                // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short

                HSSFRow row = hssfSheet.createRow(0);
                // 第四步，创建单元格，并设置值表头 设置表头居中
                HSSFCellStyle hssfCellStyle = workbook.createCellStyle();

                //居中样式
                hssfCellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);

                HSSFCell hssfCell = null;
                for (int i = 0; i < titles.length; i++) {
                    hssfCell = row.createCell(i);//列索引从0开始
                    hssfCell.setCellValue(titles[i]);//列名1
                    hssfCell.setCellStyle(hssfCellStyle);//列居中显示
                }
                //这里我把list当做数据库啦
//                String proId = req.getParameter("proId");
                String cutId = req.getParameter("cutId");
                String state = req.getParameter("state");
                List<Product> productList = null;
                productList = excelService.searchByConditions(proId, cutId, state);
                for (int i = 0; i < productList.size(); i++) {
                    row = hssfSheet.createRow(i + 1);
                    Product product = productList.get(i);

                    // 第六步，创建单元格，并设置值
//                String  proId = "";
                    if (product.getProId() != null) {
                        proId = product.getProId();
                    }
                    row.createCell(0).setCellValue(proId);
//                int cutId = 0;
//                    if (product.getCutId() != 0) {
//                        cutId = product.getCutId();
//                    }
//                    row.createCell(1).setCellValue(cutId);
                    String proName = "";
                    if (product.getProName() != null) {
                        proName = product.getProName();
                    }
                    row.createCell(2).setCellValue(proName);
                    String logistical = "";
                    if (product.getLogistical() != null) {
                        logistical = product.getLogistical();
                    }
                    row.createCell(3).setCellValue(logistical);
//                int state=0;
//                    if (product.getState() != 0) {
//                        state = product.getState();
//                    }
//                    row.createCell(4).setCellValue(state);
                    String photo = "";
                    if (product.getPhoto() != null) {
                        photo = product.getPhoto();
                    }
                    row.createCell(5).setCellValue(photo);
                    int introduction = 0;
                    if (product.getIntroduction() != 0) {
                        introduction = product.getIntroduction();
                    }
                    row.createCell(6).setCellValue(introduction);
                    float price = 0;
                    if (product.getPrice() != 0) {
                        price = product.getPrice();
                    }
                    row.createCell(7).setCellValue(price);
                    float scale = 0;
                    if (product.getScale() != 0) {
                        price = product.getScale();
                    }
                    row.createCell(8).setCellValue(scale);
                    float quantity = 0;
                    if (product.getQuantity() != 0) {
                        price = product.getQuantity();
                    }
                    row.createCell(9).setCellValue(quantity);
                }
                // 第七步，将文件输出到客户端浏览器
                try {
                    workbook.write(out);
                    out.flush();
                    out.close();

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } catch (Exception e) {
                e.printStackTrace();
//            throw new Exception("导出信息失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "导出信息失败";
        }
        return null;
    }


}