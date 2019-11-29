package com.javaweb.service.Impl;

import com.javaweb.mapper.OrganizationMapper;
import com.javaweb.model.Organization;
import com.javaweb.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrganizationSericeImpl implements OrganizationService {
    @Autowired
    OrganizationMapper organizationMapper;
    @Override
    public List<Organization> getTree(int id) throws Exception{
        // TODO Auto-generated method stub
        List<Organization> organizationList=organizationMapper.getTree(id);
        return organizationList;
    }
    @Override
    public List<Organization> getTree2(int id)throws Exception{
        // TODO Auto-generated method stub
        List<Organization> organizationList=organizationMapper.getTree2(id);
        return organizationList;
    }
}
