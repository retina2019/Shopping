package com.javaweb.mapper;

import com.javaweb.model.Product;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ProductMapper extends BaseMapper<Product>{
    List<Product> queryByConditions(@Param("proId") String proId, @Param("cut") String cut,
                          @Param("proName") String proName, @Param("proRange") String proRange,
                          @Param("states") int states, @Param("introduction") int introduction,
                          @Param("startIndex") int startIndex, @Param("pageSize") int pageSize, @Param("orderSql") String orderSql);

    int countByConditions(@Param("proId") String proId, @Param("cut") String cut,
                          @Param("proName") String proName, @Param("proRange") String proRange,
                          @Param("states") int states, @Param("introduction") int introduction);
}
