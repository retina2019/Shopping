package com.javaweb.service;

import com.javaweb.model.Dep;

import java.util.List;

public interface DepService {
    public List<Dep> searchByDepId(String depId) throws Exception;
}
