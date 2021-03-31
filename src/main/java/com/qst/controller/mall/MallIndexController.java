package com.qst.controller.mall;

import com.qst.entity.AdminUser;
import com.qst.entity.GoodsType;
import com.qst.entity.User;
import com.qst.service.GoodsTypeService;
import com.qst.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
@Controller
public class MallIndexController {
    @Autowired
    GoodsTypeService goodsTypeService;
    @Autowired
    UserService userService;
    @RequestMapping("/mall/toIndex")
    public String toIndex(Model model){
        List<GoodsType> goodsTypeList=goodsTypeService.getGoodsTypeList();
        model.addAttribute("goodsTypeList",goodsTypeList);
        return "/index";
    }

    @RequestMapping("/mall/register")
    public void registersava(@RequestParam("realName")String realName, @RequestParam("password") String password,
                             @RequestParam("password1") String password1,
                             @RequestParam("sex") Integer sex, @RequestParam("phone")String phone,
                             @RequestParam("picture")MultipartFile picture,@RequestParam("address")String address,
                             HttpServletResponse response, HttpServletRequest request)throws IOException {
        PrintWriter out=response.getWriter();
        if(realName==null || password==null || password1==null || sex==null || phone==null || picture==null || address==null){
            out.print("<script> alert('注册失败');history.go(-1)</script>");
        }
        if(userService.saveUser(realName,password,sex,phone,picture,address)){
            String location=request.getContextPath() +"/mall/toIndex";
            out.print("<script>location.href='"+location+"'</script>");
        }
        else{
            out.print("<script> history.go(-1)</script>");
        }
        out.flush();
        out.close();

    }
}
