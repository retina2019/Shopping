package com.javaweb.service;

import com.javaweb.model.Dep;

import java.util.List;

public interface DepService {
    public List<Dep> searchByDepId(String depId) throws Exception;

    public void save(Dep dep)throws Exception;

    public List<Dep> queryAll()throws Exception;

    public Dep queryByDepId(String depId)throws Exception;

    public void edit(Dep department)throws Exception;
}
