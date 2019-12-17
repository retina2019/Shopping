package com.javaweb.service.Impl;

import com.javaweb.mapper.AdminMapper;
import com.javaweb.mapper.UserMapper;
import com.javaweb.model.Admin;
import com.javaweb.model.User;
import com.javaweb.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminMapper adminMapper;
    @Override
    public List<Admin> queryByConditions(String userId, String userName, int state, int startIndex, int pageSize, String orderSql)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("queryByConditions:"+userId+userName+state);
        List<Admin> admin = adminMapper.queryByConditions(userId,userName,state,startIndex, pageSize,orderSql);
        return admin;
    }
    @Override
    public void save(Admin admin)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("admin service:"+admin.getUserName());
        adminMapper.add(admin);
    }
@Override
public  int countByConditions(String userId, String userName, int state)throws Exception{
    // TODO Auto-generated method stub
    System.out.println("countByConditions:"+userId+userName+state);
    int count=adminMapper.countByConditions(userId,userName,state);
    return count;
    }
    @Override
    public Admin queryByUerId(String userId)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("queryByUserId:"+userId);
        Admin admin=adminMapper.queryByUserId(userId);
        return admin;
    }
    @Override
    public  void edit(Admin admin)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("adminservice:"+admin.getUserId());
        adminMapper.edit(admin);
    }
    @Override
    public void deleteByUserId(int userId)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("deleteByUserId:"+userId);
        adminMapper.deleteByUserId(userId);
    }
    @Override
    public Admin queryByUserName(String userName)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("queryByUsername:"+userName);
        Admin admin=adminMapper.queryByUserName(userName);
        return admin;
    }
}
