package com.qst.controller.mall;

import com.qst.entity.User;
import com.qst.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
@Controller
public class MallUserController {
    @Autowired
    UserService userService;
    @RequestMapping("/mall/login")
    public String login(@RequestParam("phone") String phone,
                        @RequestParam("password") String password,
                        HttpSession session, Model model){
        User user=userService.loginuser(phone,password);
        if(user!=null)
        {
            session.setAttribute("UserRealName",user.getRealName());
            session.setAttribute("UserId",user.getId());
            return "redirect:/mall/toIndex";
        }else{
            model.addAttribute("errorMsg1","登陆失败，手机号或密码错误");
            return "/login";
        }
    }
}
