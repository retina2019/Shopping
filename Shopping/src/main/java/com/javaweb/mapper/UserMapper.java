package com.javaweb.mapper;

import com.javaweb.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface UserMapper extends BaseMapper<User> {

	void add(User user);
	User queryByUserName(String userName);

    List<User> queryByConditions(@Param("userId")String userId, @Param("userName") String userName,
								 @Param("sex") int sex, @Param("startIndex") int startIndex,
								 @Param("pageSize") int pageSize, @Param("orderSql") String orderSql);

	int countByConditions(@Param("userId") String userId,@Param("userName") String userName, @Param("sex") int sex);

	User queryByUserId(@Param("userId") String userId);

	void edit(User user);

	void deleteByUserId(int userId);

	List<User> queryByShopConditions(@Param("userId") String userId, @Param("userName") String userName,
									 @Param("state") int state, @Param("startIndex") int startIndex,
									 @Param("pageSize") int pageSize, @Param("orderSql") String orderSql);

	int countByShopConditions(@Param("userId") String userId, @Param("userName") String userName,
							  @Param("state") int state);

    void editor(User user);
}
