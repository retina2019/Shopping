package com.javaweb.mapper;

import com.javaweb.model.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper {
    List<Product> searchByProId(@Param("proId") String proId);


    int countByConditions(@Param("proId") String proId,@Param("cut") String cut, @Param("state") int state);

    List<Product> queryByConditions(@Param("proId") String proId, @Param("cut") String cut,
                                    @Param("state") int state, @Param("startIndex") int startIndex,
                                    @Param("pageSize") int pageSize, @Param("orderSql") String orderSql);



}
