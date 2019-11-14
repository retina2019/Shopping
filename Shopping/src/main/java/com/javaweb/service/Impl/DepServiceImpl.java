package com.javaweb.service.Impl;

import com.javaweb.mapper.DepMapper;
import com.javaweb.model.Dep;
import com.javaweb.service.DepService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepServiceImpl implements DepService {
    @Autowired
    DepMapper depMapper;
    @Override
    public List<Dep> searchByDepId(String depId)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("searchByDepId:"+depId);
        List<Dep> dep = depMapper.searchByDepId(depId);
        return dep;
    }

}
