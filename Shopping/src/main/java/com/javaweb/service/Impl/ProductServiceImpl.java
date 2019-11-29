package com.javaweb.service.Impl;

import com.javaweb.mapper.ProductMapper;
import com.javaweb.model.Product;
import com.javaweb.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public  class ProductServiceImpl implements ProductService {
    @Autowired
    ProductMapper productMapper;


    @Override
    public List<Product> queryByConditions(String proId, String cut, int state, int startIndex, int pageSize, String orderSql)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("searchByConditions:"+proId+cut+state);
        List<Product> product=productMapper.queryByConditions(proId,cut,state,startIndex,pageSize,orderSql);
        return product;
    }
    @Override
    public int countByConditions(String proId, String cut, int state)throws Exception {
        // TODO Auto-generated method stub
        System.out.println("countByConditions:" + proId + cut + state);
        int count = productMapper.countByConditions(proId, cut, state);
        return count;
    }
    @Override
    public void save(Product product)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("product service:" + product.getProName());
        productMapper.add(product);
    }
    @Override
    public  Product queryByproId(String proId) throws Exception{
        // TODO Auto-generated method stub
        System.out.println("queryByproId:"+proId);
        Product product=productMapper.queryByproId(proId);
        return product;
    }
    @Override
    public void edit(Product product)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("productservice:"+product.getProId());
        productMapper.edit(product);
    }
    @Override
    public void deleteByProId(String proId)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("deleteByProId:"+proId);
        productMapper.deleteByProId(proId);
    }
}
