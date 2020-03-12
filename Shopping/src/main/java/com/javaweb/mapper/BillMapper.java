package com.javaweb.mapper;

import com.javaweb.model.Bill;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BillMapper extends BaseMapper<Bill> {

    List<Bill> queryByConditions(@Param("orderId") String orderId, @Param("companyName") String companyName, @Param("tfn") String tfn,
                                 @Param("items") String items,@Param("remarks")String remarks, @Param("userId") String userId, @Param("state") int state,
                                 @Param("applytimebegin") String applytimebegin, @Param("applytimeend") String applytimeend,
                                 @Param("startIndex") int startIndex, @Param("pageSize") int pageSize, @Param("orderSql") String orderSql);

    int countByConditions(@Param("orderId") String orderId, @Param("companyName") String companyName, @Param("tfn") String tfn,
                          @Param("items") String items,@Param("remarks")String remarks, @Param("userId") String userId, @Param("state") int state,
                          @Param("applytimebegin") String applytimebegin, @Param("applytimeend") String applytimeend);

    void add(Bill bill);

    Bill queryByOrderId(@Param("orderId") String orderId);

    void edit(Bill bill);

    void deleteByOrderId(@Param("orderId") String orderId);
}
