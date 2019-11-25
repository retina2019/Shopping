package com.javaweb.service.Impl;

import com.javaweb.mapper.CutMapper;
import com.javaweb.model.Category;
import com.javaweb.service.CutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CutServiceImpl implements CutService {
    @Autowired
    CutMapper cutMapper;
    @Override
    public List<Category> searchByCutId(String cutId)throws Exception{
        // TODO Auto-generated method stub
        System.out.println("searchByCutId:"+cutId);
        List<Category> cut = cutMapper.searchByCutId(cutId);
        return cut;
    }

    @Override
    public void save(Category cut) throws Exception {
        // TODO Auto-generated method stub
        System.out.println("cut service:" + cut.getCut());
        cutMapper.add(cut);
    }
    @Override
    public List<Category> searchAll() throws Exception{
        // TODO Auto-generated method stub
        List<Category> listcut=cutMapper.searchAll();
        return listcut;
    }
}
