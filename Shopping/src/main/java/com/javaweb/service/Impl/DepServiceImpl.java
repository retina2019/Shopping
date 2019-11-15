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
    @Override
    public void save(Dep dep)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("dep service:"+dep.getDepName());
        depMapper.add(dep);
    }
    @Override
    public List<Dep> queryAll()throws Exception{
        // TODO Auto-generated method stub
        List<Dep> listdepartment = depMapper.queryAll();
        return listdepartment;
    }
}
