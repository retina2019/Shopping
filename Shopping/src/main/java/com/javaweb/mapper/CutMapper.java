package com.javaweb.mapper;

import com.javaweb.model.Category;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface CutMapper extends BaseMapper<Category> {
    List<Category> searchByCutId(@Param("cutId") String cutId);

    void add(Category cut);

    List<Category> searchAll();
}
