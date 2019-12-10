package com.javaweb.service;

import com.javaweb.model.Product;

import java.util.List;


public interface ProductService  {
   public List<Product> queryByConditions(String proId, String cutId, int state, int startIndex, int pageSize, String orderSql)throws Exception;

   public int countByConditions(String proId, String cutId, int state)throws Exception;

   public void save(Product product)throws Exception;

  public  Product queryByproId(String proId) throws Exception;

   public void edit(Product product)throws Exception;

    public void deleteByProId(String proId)throws Exception;

    public List<Product> queryAll() throws Exception;
}
