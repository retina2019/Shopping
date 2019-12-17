package com.javaweb.service.Impl;

import com.javaweb.mapper.ShopMapper;
import com.javaweb.model.Shop;
import com.javaweb.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopServiceImpl implements ShopService {
    @Autowired
    ShopMapper shopMapper;
    @Override
    public Shop queryByShopName(String shopName)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("queryByShopName="+shopName);
        Shop shop=shopMapper.queryByShopName(shopName);
        return shop;
    }
    @Override
    public List<Shop> queryByShopConditions(String shopId, String shopName, int startIndex, int pageSize, String orderSql)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("queryByConditions:"+shopId+shopName);
        List<Shop> shop = shopMapper.queryByConditions(shopId,shopName,startIndex, pageSize,orderSql);
        return shop;
    }
    @Override
    public  int countByShopConditions(String shopId, String shopName)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("countByConditions:"+shopId+shopName);
        int count=shopMapper.countByConditions(shopId,shopName);
        return count;
    }
    @Override
    public  Shop queryByShopId(String shopId)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("queryByShopId:"+shopId);
        Shop shop=shopMapper.queryByShopId(shopId);
        return shop;
    }

    @Override
    public  void deleteByShopId(String shopId)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("deleteByShopId:"+shopId);
        shopMapper.deleteByShopId(shopId);
    }
    @Override
    public  void save(Shop shop)throws Exception{
        // TODO Auto-generated method stub
        // TODO Auto-generated method stub
        System.out.println("shopService:"+shop.getShopName());
        shopMapper.add(shop);
    }
    @Override
    public  void edit(Shop shop)throws Exception{
            // TODO Auto-generated method stub
            System.out.println("shopservice:"+shop.getShopId());
            shopMapper.edit(shop);
        }

}
