package com.javaweb.mapper;

import com.javaweb.model.ChartPie;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ChartPieMapper extends BaseMapper<ChartPie>{
    List<ChartPie> sumTotal();
}
