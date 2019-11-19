package com.javaweb.service;

import com.javaweb.model.Product;

import java.util.List;

public interface ProductService {
  public  List<Product> queryByConditions(String proId, String cut, String proName, String proRange, int states, int introduction, int startIndex, int pageSize, String orderSql)throws Exception;

  public  int countByConditions(String proId, String cut, String proName, String proRange, int states, int introduction)throws Exception;
}
