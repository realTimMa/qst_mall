package com.qst.controller.mall;

import com.qst.common.Result;
import com.qst.entity.Order;
import com.qst.entity.User;
import com.qst.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class MallOrderController {
    @Autowired
    OrderService orderService;
    @RequestMapping("/mall/saveOrder")
    @ResponseBody
    public Result saveOrder(@RequestBody Order order,
                            HttpSession session){
        System.out.println(order.getGoodId());
        System.out.println(order.getNum());
        Integer  userId=(Integer) session.getAttribute("UserId");
        Result result=new Result();
        if(userId==null){
            result.setMessage("notLogin");
            return result;
        }
        order.setUserId(userId);
        if(orderService.saveOrder(order)){
            result.setMessage("success");
            result.setData(order);
            return result;
        }
        result.setMessage("error");
        return result;
    }
}
