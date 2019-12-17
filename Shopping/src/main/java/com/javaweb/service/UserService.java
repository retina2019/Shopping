package com.javaweb.service;

import com.javaweb.model.User;

import java.util.List;

public interface UserService {
    public void save(User user) throws Exception;
    public User queryByUserName(String userName)throws Exception;

    public List<User> queryByConditions(String userId, String userName, int sex, int startIndex, int pageSize, String orderSql)throws Exception;

   public int countByConditions(String userId, String userName, int sex)throws Exception;

   public User queryByUerId(String userId)throws Exception;

    public void edit(User user)throws Exception;

    public void deleteByUserId(int userId)throws Exception;

   public List<User> queryByShopConditions(String userId, String userName, int state, int startIndex, int pageSize, String orderSql)throws Exception;

    public int countByShopConditions(String userId, String userName, int state)throws Exception;

    public void editor(User user)throws Exception;

    public User searchByUserName(String userName)throws Exception;
}
