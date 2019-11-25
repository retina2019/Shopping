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

    Category queryByCutId(@Param("cutId") String cutId);

    void edit(Category cut);

    void deleteByCutId(@Param("cutId") int cutId);
}
