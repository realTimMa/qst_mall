package com.qst.dao;

import com.qst.entity.Order;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface OrderDao {
    int saveOrder(Order order);
}
