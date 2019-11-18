package com.javaweb.mapper;

import com.javaweb.model.Admin;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminMapper extends BaseMapper<Admin> {

    List<Admin> queryByConditions(@Param("userId") String userId, @Param("userName") String userName,
                                  @Param("state") int state, @Param("startIndex") int startIndex,
                                  @Param("pageSize") int pageSize, @Param("orderSql") String orderSql);

    void add(Admin admin);

    int countByConditions(@Param("userId") String userId, @Param("userName") String userName,@Param("state") int state);

    Admin queryByUserId(@Param("userId") String userId);

    void edit(Admin admin);

    void deleteByUserId(int userId);
}
