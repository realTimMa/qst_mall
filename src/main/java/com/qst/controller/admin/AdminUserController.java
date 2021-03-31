package com.qst.controller.admin;

import com.qst.entity.AdminUser;
import com.qst.service.AdminUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class AdminUserController {

    @Autowired
    AdminUserService adminUserService;

    @RequestMapping("/admin/toMain")
    public String toMain(){
        return "/admin/main";
    }

    @RequestMapping("/admin/login")
    public String login(@RequestParam("username")String username,
                        @RequestParam("password")String password,
                        HttpSession session, Model model){

       AdminUser adminUser= adminUserService.login(username,password);
       if (adminUser!=null){
           //查到用户
           session.setAttribute("loginUser",adminUser.getUsername());
           return "redirect:/admin/toMain";
       }else{
           //未查找到
           model.addAttribute("errorMsg","登陆失败，用户名或密码错误");
           return "/admin/login";
       }

    }
    @RequestMapping("/admin/toIndex")
    public String index(){
        return "/admin/index";
    }
}
