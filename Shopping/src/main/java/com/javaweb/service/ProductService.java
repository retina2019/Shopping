package com.javaweb.service;

import com.javaweb.model.Product;

import java.util.List;


public interface ProductService  {
   public List<Product> queryByConditions(String proId, String cut, int state, int startIndex, int pageSize, String orderSql)throws Exception;

   public int countByConditions(String proId, String cut, int state)throws Exception;

}
