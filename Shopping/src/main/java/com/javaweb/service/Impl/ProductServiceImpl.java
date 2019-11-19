package com.javaweb.service.Impl;

import com.javaweb.mapper.ProductMapper;
import com.javaweb.model.Admin;
import com.javaweb.model.Product;
import com.javaweb.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductMapper productMapper;
    @Override
    public List<Product> queryByConditions(String proId, String cut, String proName, String proRange, int states, int introduction, int startIndex, int pageSize, String orderSql)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("queryByConditions:"+proId+cut+proName+proRange+states+introduction);
        List<Product> product = productMapper.queryByConditions(proId,cut,proName,proRange,states,introduction,startIndex, pageSize,orderSql);
        return product;
    }
    @Override
    public  int countByConditions(String proId, String cut, String proName, String proRange, int states, int introduction)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("countByConditions:"+proId+cut+proName+proRange+states+introduction);
        int count=productMapper.countByConditions(proId,cut,proName,proRange,states,introduction);
        return count;
    }
}
