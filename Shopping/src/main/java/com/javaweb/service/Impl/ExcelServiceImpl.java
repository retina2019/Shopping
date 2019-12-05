package com.javaweb.service.Impl;

import com.javaweb.mapper.ProductMapper;
import com.javaweb.model.Product;
import com.javaweb.service.ExcelService;
import org.apache.poi.hssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.ServletOutputStream;
import java.util.List;

@Service
public class ExcelServiceImpl implements ExcelService {
    @Autowired
    ProductMapper productMapper;
    @Override
    public List<Product> searchByConditions(String proId, String cutId, String state)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("searchByConditions:"+proId+cutId+state);
        List<Product> product=productMapper.searchByConditions(proId,cutId,state);
        return product;
    }
    @Override
    public void export(String[] titles, ServletOutputStream out)throws Exception{
        try{
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

//            // 第五步，写入实体数据
//            Person  person1=new Person("1","张三","123","26");
//            Person  person2=new Person("2","李四","123","18");
//            Person  person3=new Person("3","王五","123","77");
//            Person  person4=new Person("4","徐小筱","123","1");

            //这里我把list当做数据库啦
            List<Product> listproduct = productMapper.queryAll();
            //  ArrayList<Person> list=excelMapper.queryAll();
            for (int i = 0; i < listproduct.size(); i++) {
                row = hssfSheet.createRow(i+1);
                Product product = listproduct.get(i);

                // 第六步，创建单元格，并设置值
                String  proId = "";
                if(product.getProId() != null){
                    proId = product.getProId();
                }
                row.createCell(0).setCellValue(proId);
                int cutId = 0;
                if(product.getCutId() != 0){
                    cutId = product.getCutId();
                }
                row.createCell(1).setCellValue(cutId);
                String proName = "";
                if(product.getProName() != null){
                    proName= product.getProName();
                }
                row.createCell(2).setCellValue(proName);
                String logistical="";
                if(product.getLogistical() !=null){
                    logistical = product.getLogistical();
                }
                row.createCell(3).setCellValue(logistical);
                int state=0;
                if(product.getState() !=0){
                    state = product.getState();
                }
                row.createCell(4).setCellValue(state);
                String photo="";
                if(product.getPhoto() !=null){
                    photo = product.getPhoto();
                }
                row.createCell(5).setCellValue(photo);
                int introduction=0;
                if(product.getIntroduction() !=0){
                    introduction = product.getIntroduction();
                }
                row.createCell(6).setCellValue(introduction);
                float price=0;
                if(product.getPrice() !=0){
                    price = product.getPrice();
                }
                row.createCell(7).setCellValue(price);
                float scale=0;
                if(product.getScale() !=0){
                    price = product.getScale();
                }
                row.createCell(8).setCellValue(scale);
                float quantity=0;
                if(product.getQuantity() !=0){
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
        }catch(Exception e){
            e.printStackTrace();
            throw new Exception("导出信息失败！");

        }
    }

}
