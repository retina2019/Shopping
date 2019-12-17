package com.javaweb.mapper;

import com.javaweb.model.ShopCategory;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ShopcutMapper extends BaseMapper<ShopCategory> {
    List<ShopCategory> searchByShopcutId(@Param("shopcutId") String shopcutId);

    List<ShopCategory> searchAll();

    void add(ShopCategory shopcut);

    ShopCategory queryByShopcutId(@Param("shopcutId") String shopcutId);

    void edit(ShopCategory shopCategory);

    void deleteByShopcutId(@Param("shopcutId") int shopcutId);
}
