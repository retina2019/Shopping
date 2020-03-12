package com.javaweb.service.Impl;

import com.javaweb.mapper.OrderMapper;
import com.javaweb.model.Order;
import com.javaweb.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderMapper orderMapper;

    @Override
    public List<Order> queryByConditions(String tel, int userId, String userName, String orderId,
                                         String payNo, String verification, String proId, String proName, String expand, int state,
                                         String transbegin, String transend, String updatebegin, String updateend,
                                         int startIndex, int pageSize, String orderSql)throws Exception {
        // TODO Auto-generated method stub
        System.out.println("queryByConditions:" +tel + userId + userName + orderId +payNo+verification+proId+proName+expand+state+transbegin+transend+updatebegin+updateend);
        List<Order> orders = orderMapper.queryByConditions(tel,userId,userName,orderId,payNo,verification,proId,proName,expand,state,transbegin,transend,updatebegin,updateend,startIndex,pageSize,orderSql);
        return orders;
    }
@Override
public  int countByConditions(String tel, int userId, String userName, String orderId, String payNo, String verification, String proId, String proName, String expand, int state, String transbegin, String transend, String updatebegin, String updateend)throws Exception{
    // TODO Auto-generated method stub
    System.out.println("countByConditions:"+tel + userId + userName + orderId + payNo+verification+proId+proName+expand+state+transbegin+transend+updatebegin+updateend);
    int count=orderMapper.countByConditions(tel,userId,userName,orderId,payNo,verification,proId,proName,expand,state,transbegin,transend,updatebegin,updateend);
    return count;
}
@Override
public  void add(Order order)throws Exception{
    // TODO Auto-generated method stub
    System.out.println("order service:" + order.getProId());
    orderMapper.add(order);
}
@Override
public  Order queryByOrderId(String orderId)throws Exception{
    // TODO Auto-generated method stub
    System.out.println("queryByOrderId:"+orderId);
    Order order=orderMapper.queryByOrderId(orderId);
    return order;
}
@Override
public void edit(Order order)throws Exception{
    // TODO Auto-generated method stub
    System.out.println("orderservice:"+order.getOrderId());
    orderMapper.edit(order);
}
}
