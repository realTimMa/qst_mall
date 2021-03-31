package com.qst.service.impl;

import com.qst.dao.GoodDao;
import com.qst.dao.OrderDao;
import com.qst.entity.Good;
import com.qst.entity.Order;
import com.qst.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderDao orderDao;
    @Autowired
    GoodDao goodDao;
    @Override
    public boolean saveOrder(Order order) {
        Good good=goodDao.findGoodByPrimaryKey(order.getGoodId());
        float totalPrice=order.getNum()*good.getGoodPrice();
        order.setTotalPrice(totalPrice);
        order.setStatus(0);
        return orderDao.saveOrder(order)>0;
    }
}
