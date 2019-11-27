package com.javaweb.mapper;

import com.javaweb.model.Organization;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrganizationMapper extends BaseMapper<Organization> {
    List<Organization> getTree(@Param("id") int id);
}
