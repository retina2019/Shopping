package com.javaweb.service;

import com.javaweb.model.Admin;

import java.util.List;

public interface AdminService {
   public List<Admin> queryByConditions(String userId, String userName, int state, int startIndex, int parseInt, String orderSql)throws Exception;

  public void save(Admin admin)throws Exception;

 public  int countByConditions(String userId, String userName, int state)throws Exception;

  public Admin queryByUerId(String userId)throws Exception;

  public  void edit(Admin admin)throws Exception;
}
