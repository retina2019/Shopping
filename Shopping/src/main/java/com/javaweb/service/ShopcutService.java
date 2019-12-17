package com.javaweb.service;

import com.javaweb.model.ShopCategory;

import java.util.List;

public interface ShopcutService {
  public  List<ShopCategory> searchByShopcutId(String shopcutId)throws Exception;

   public List<ShopCategory> searchAll()throws Exception;

  public void save(ShopCategory shopcut)throws Exception;

  public ShopCategory queryByShopcutId(String shopcutId)throws Exception;

   public void edit(ShopCategory shopCategory)throws Exception;

   public void deleteByShopcutId(int shopcutId)throws Exception;
}
