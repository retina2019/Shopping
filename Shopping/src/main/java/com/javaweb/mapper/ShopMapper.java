package com.javaweb.mapper;

import com.javaweb.model.Shop;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShopMapper extends BaseMapper<Shop>{
    Shop queryByShopName(@Param("shopName") String shopName);

    List<Shop> queryByConditions(@Param("shopId") String shopId, @Param("shopName") String shopName, @Param("startIndex") int startIndex, @Param("pageSize") int pageSize, @Param("orderSql") String orderSql);

    int countByConditions(@Param("shopId") String shopId, @Param("shopName") String shopName);

    Shop queryByShopId(@Param("shopId") String shopId);

    void edit(Shop shop);

    void deleteByShopId(@Param("shopId") String shopId);

    void add(Shop shop);
}
