package com.javaweb.service.Impl;

import com.javaweb.mapper.UserMapper;
import com.javaweb.model.Admin;
import com.javaweb.model.User;
import com.javaweb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    @Override
    public void save(User user) throws Exception{
        // TODO Auto-generated method stub
        System.out.println("user service:"+user.getUserName());
        userMapper.add(user);
    }
    @Override
    public User queryByUserName(String userName)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("queryByUsername:"+userName);
         User user=userMapper.queryByUserName(userName);
         return user;
    }
    @Override
    public List<User> queryByConditions(String userId, String userName, int sex, int startIndex, int pageSize, String orderSql)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("queryByConditions:"+userId+userName+sex);
        List<User> user = userMapper.queryByConditions(userId,userName,sex,startIndex, pageSize,orderSql);
        return user;
    }
    @Override
    public int countByConditions(String userId, String userName, int sex)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("countByConditions:"+userId+userName+sex);
        int count=userMapper.countByConditions(userId,userName,sex);
        return count;
    }
    @Override
    public User queryByUerId(String userId)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("queryByUserId:"+userId);
        User user=userMapper.queryByUserId(userId);
        return user;
    }
    @Override
    public void edit(User user)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("userservice:"+user.getUserId());
        userMapper.edit(user);
    }
    @Override
    public void deleteByUserId(int userId)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("deleteByUserId:"+userId);
        userMapper.deleteByUserId(userId);

    }
    @Override
    public List<User> queryByShopConditions(String userId, String userName, int state, int startIndex, int pageSize, String orderSql)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("queryByShopConditions:"+userId+userName+state);
        List<User> user = userMapper.queryByShopConditions(userId,userName,state,startIndex, pageSize,orderSql);
        return user;
    }
    @Override
    public int countByShopConditions(String userId, String userName, int state)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("countByConditions:"+userId+userName+state);
        int count=userMapper.countByShopConditions(userId,userName,state);
        return count;
    }
    @Override
    public void editor(User user)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("userservice:"+user.getUserId());
        userMapper.editor(user);
    }
    @Override
    public User searchByUserName(String userName)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("queryByUsername:"+userName);
        User user=userMapper.searchByUserName(userName);
        return user;
    }
}
