package com.javaweb.service;



import com.javaweb.model.Order;

import java.util.List;

public interface OrderService {
  public  List<Order> queryByConditions(String tel, int userId, String userName, String orderId, String payNo, String verification, String proId, String proName, String expand, int state, String transbegin, String transend, String updatebegin, String updateend, int startIndex, int pageSize, String orderSql)throws Exception;

  public  int countByConditions(String tel, int userId, String userName, String orderId, String payNo, String verification, String proId, String proName, String expand, int state, String transbegin, String transend, String updatebegin, String updateend)throws Exception;

  public  void add(Order order)throws Exception;

  public  Order queryByOrderId(String orderId)throws Exception;

  public void edit(Order order)throws Exception;
}
