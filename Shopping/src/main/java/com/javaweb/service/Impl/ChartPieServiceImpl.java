package com.javaweb.service.Impl;

import com.javaweb.mapper.ChartPieMapper;
import com.javaweb.model.ChartPie;
import com.javaweb.service.ChartPieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ChartPieServiceImpl implements ChartPieService {
    @Autowired
    ChartPieMapper chartPieMapper;
    @Override
    public List<ChartPie> sumTotal() throws Exception{
        // TODO Auto-generated method stub
        System.out.println("sumTotal:" );
        List<ChartPie> list=chartPieMapper.sumTotal();
        return list;
    }
}
