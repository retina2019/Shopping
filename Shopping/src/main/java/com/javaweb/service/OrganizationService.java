package com.javaweb.service;

import com.javaweb.model.Organization;

import java.util.List;

public interface OrganizationService {
   public List<Organization> getTree(int id) throws Exception;
}
