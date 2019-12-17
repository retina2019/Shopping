package com.javaweb.service.Impl;

import com.javaweb.mapper.ShopcutMapper;
import com.javaweb.model.ShopCategory;
import com.javaweb.service.ShopcutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class ShopcutServiceImpl implements ShopcutService {
    @Autowired
    ShopcutMapper shopcutMapper;
    @Override
    public List<ShopCategory> searchByShopcutId(String shopcutId)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("searchByShopcutId:"+shopcutId);
        List<ShopCategory> shopcut = shopcutMapper.searchByShopcutId(shopcutId);
        return shopcut;
    }
    @Override
    public List<ShopCategory> searchAll()throws Exception{
        // TODO Auto-generated method stub
        List<ShopCategory> listshopcut=shopcutMapper.searchAll();
        return listshopcut;
    }
    @Override
    public void save(ShopCategory shopcut)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("shopcutservice:" + shopcut.getShopcut());
        shopcutMapper.add(shopcut);
    }
    @Override
    public ShopCategory queryByShopcutId(String shopcutId)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("queryByShopcutId:"+shopcutId);
        ShopCategory shopcut=shopcutMapper.queryByShopcutId(shopcutId);
        return shopcut;
    }
    @Override
    public void edit(ShopCategory shopCategory)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("shopcutService:"+shopCategory.getShopcutId());
        shopcutMapper.edit(shopCategory);
    }
    @Override
    public void deleteByShopcutId(int shopcutId)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("deleteByShopcutId:"+shopcutId);
        shopcutMapper.deleteByShopcutId(shopcutId);
    }
}
