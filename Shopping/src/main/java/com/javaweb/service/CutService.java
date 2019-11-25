package com.javaweb.service;

import com.javaweb.model.Category;

import java.util.List;

public interface CutService {
   public List<Category> searchByCutId(String cutId)throws Exception;

   public List<Category> searchAll() throws Exception;

   public void save(Category cut) throws Exception;

   public Category queryByCutId(String cutId)throws Exception;

   public  void edit(Category cut) throws Exception;

  public  void deleteByCutId(int cutId) throws Exception;
}
