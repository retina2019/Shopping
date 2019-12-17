package com.javaweb.mapper;

import com.javaweb.model.Order;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface OrderMapper extends BaseMapper<Order> {
    List<Order> queryByConditions(String tel, int userId, String userName, String orderId, String payNo, String verification, String proId, String proName, String expand, int state, String transbegin, String transend, String updatebegin, String updateend, int startIndex, int pageSize, String orderSql);

    int countByConditions(String tel, int userId, String userName, String orderId, String payNo, String verification, String proId, String proName, String expand, int state, String transbegin, String transend, String updatebegin, String updateend);
}
