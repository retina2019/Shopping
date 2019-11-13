package com.javaweb.mapper;

import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 *
 * @author stone
 *
 * @param <T>
 */
@Repository
public interface BaseMapper<T> {

    T queryById(Object id);

    List<T> queryByCondition(Map condition);

    //T queryByCondition(Map condition, PageBounds pageBounds);

    List<T> queryAll();

    int create(T t);

    int update(T t);

    int updateByCondition(Map condition);

    int delete(T t);

    int deleteById(Object id);

    int count(Map condition);

    T querySingle(Map condition);

}
