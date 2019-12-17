package com.javaweb.service;

import com.javaweb.model.Shop;

import java.util.List;

public interface ShopService {
   public Shop queryByShopName(String shopName)throws Exception;

   public List<Shop> queryByShopConditions(String shopId, String shopName, int startIndex, int pageSize, String orderSql)throws Exception;

  public  int countByShopConditions(String shopId, String shopName)throws Exception;

  public  Shop queryByShopId(String shopId)throws Exception;

  public  void deleteByShopId(String shopId)throws Exception;

  public  void save(Shop shop)throws Exception;

  public  void edit(Shop shop)throws Exception;
}
