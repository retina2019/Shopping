package com.javaweb.mapper;

import com.javaweb.model.Dep;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepMapper {
    List<Dep> searchByDepId(@Param("depId") String depId);

    void add(Dep dep);

    List<Dep> queryAll();

    Dep queryByDepId(@Param("depId") String depId);

    void edit(Dep department);

    void deleteByDepId(int depId);
}
