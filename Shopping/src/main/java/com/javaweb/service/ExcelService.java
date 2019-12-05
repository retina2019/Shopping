package com.javaweb.service;

import com.javaweb.model.Product;

import javax.servlet.ServletOutputStream;
import java.util.List;

public interface ExcelService {



    public List<Product> searchByConditions(String proId, String cutId, String state)throws Exception;


   public void export(String[] titles, ServletOutputStream out)throws Exception;
}
