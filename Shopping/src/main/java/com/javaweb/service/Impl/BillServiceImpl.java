package com.javaweb.service.Impl;

import com.javaweb.mapper.BillMapper;
import com.javaweb.model.Bill;
import com.javaweb.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BillServiceImpl implements BillService {
    @Autowired
    BillMapper billMapper;
    @Override
    public  List<Bill> queryByConditions(String orderId, String companyName, String tfn, String items, String remarks,String userId, int state, String applytimebegin, String applytimeend, int startIndex, int pageSize, String orderSql)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("queryByConditions:" +orderId + companyName + tfn +items+ remarks+userId +state+applytimebegin+applytimeend);
        List<Bill> bills = billMapper.queryByConditions(orderId,companyName,tfn,items,remarks,userId,state,applytimebegin,applytimeend,startIndex,pageSize,orderSql);
        return bills;
    }
    @Override
    public   int countByConditions(String orderId, String companyName, String tfn, String items, String remarks,String userId, int state, String applytimebegin, String applytimeend) throws Exception{
        // TODO Auto-generated method stub
        int count=billMapper.countByConditions(orderId,companyName,tfn,items,remarks,userId,state,applytimebegin,applytimeend);
        return count;
    }
    @Override
    public  void save(Bill bill) throws Exception{
        // TODO Auto-generated method stub
        System.out.println("billservice:" + bill.getOrderId());
        billMapper.add(bill);
    }
    @Override
    public Bill queryByOrderId(String orderId)throws Exception{
        // TODO Auto-generated method stub
       Bill bill= billMapper.queryByOrderId(orderId);
       return bill;
    }
    @Override
    public  void edit(Bill bill) throws Exception{
        // TODO Auto-generated method stub
        billMapper.edit(bill);
    }
    @Override
    public   void deleteByOrderId(String orderId) throws Exception{
        // TODO Auto-generated method stub
        billMapper.deleteByOrderId(orderId);
    }
}
