package com.javaweb.service.Impl;

import com.javaweb.mapper.UserMapper;
import com.javaweb.model.User;
import com.javaweb.service.JavauserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JavauserServiceImpl implements JavauserService {
    @Autowired
    UserMapper userMapper;
//    @Override
//    public User queryAll()throws Exception{
//        // TODO Auto-generated method stub
//
//    }
}
