package com.javaweb.mapper;

import com.javaweb.model.Product;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ProductMapper extends BaseMapper<Product> {
    List<Product> searchByProId(@Param("proId") String proId);


    int countByConditions(@Param("proId") String proId,@Param("cutId") String cutId, @Param("state") int state);

    List<Product> queryByConditions(@Param("proId") String proId, @Param("cutId") String cutId,
                                    @Param("state") int state, @Param("startIndex") int startIndex,
                                    @Param("pageSize") int pageSize, @Param("orderSql") String orderSql);


    void add(Product product);

    Product queryByproId(@Param("proId") String proId);

    void edit(Product product);

    void deleteByProId(String proId);
    List<Product> queryAll();

    List<Product> searchByConditions(@Param("proId") String proId, @Param("cutId") String cutId, @Param("state") String state);
}
