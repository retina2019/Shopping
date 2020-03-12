package com.javaweb.service;

import com.javaweb.model.Bill;

import java.util.List;

public interface BillService {
  public  List<Bill> queryByConditions(String orderId, String companyName, String tfn, String items, String remarks,String userId, int state, String applytimebegin, String applytimeend, int startIndex, int parseInt, String orderSql)throws Exception;

 public   int countByConditions(String orderId, String companyName, String tfn, String items, String remarks,String userId, int state, String applytimebegin, String applytimeend) throws Exception;

  public  void save(Bill bill) throws Exception;

 public Bill queryByOrderId(String orderId)throws Exception;

  public  void edit(Bill bill) throws Exception;

 public   void deleteByOrderId(String orderId) throws Exception;
}
