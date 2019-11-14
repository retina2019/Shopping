package com.javaweb.mapper;

import com.javaweb.model.Dep;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepMapper {
    List<Dep> searchByDepId(@Param("depId") String depId);
}
