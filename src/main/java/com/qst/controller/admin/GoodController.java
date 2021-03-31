package com.qst.controller.admin;

import com.qst.entity.Good;
import com.qst.entity.GoodsType;
import com.qst.service.GoodService;
import com.qst.service.GoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
public class GoodController {
    @Autowired
    GoodService goodService;
    @Autowired
    GoodsTypeService goodsTypeService;
    @RequestMapping("/admin/good/list")
    public String getGoodList(Model model){
     List<GoodsType>  goodsTypeList=goodsTypeService.getGoodsTypeList();
     List<Good>goodList= goodService.getGoodList();
     model.addAttribute("goodsTypeList",goodsTypeList);
     model.addAttribute("goodList",goodList);
     return "/admin/mall_goods";
    }
    @RequestMapping("/admin/good/edit")
    public String edit(Model model){
        List<GoodsType> goodsTypeList=goodsTypeService.getGoodsTypeList();
        model.addAttribute("goodsTypeList",goodsTypeList);
        return "/admin/addGood";
    }

    @RequestMapping("/admin/good/save")
    public void save(  @RequestParam("goodName") String goodName, @RequestParam("goodsType") Integer goodsType,
                       @RequestParam("goodPrice") Float goodPrice,@RequestParam("goodStore") Integer goodStore,
                       @RequestParam("detail") String detail, @RequestParam("picture") MultipartFile picture,
                       HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println(goodName);
        PrintWriter out=response.getWriter();
        if(goodService.saveGood(goodName,goodsType,goodPrice,goodStore,detail,picture)){
            String location=request.getContextPath() +"/admin/good/list";
            out.print("<script> alert('添加成功');location.href='"+ location+ "'</script>");
        } else{
            out.print("<script> alert('添加失败');history.go(-1)</script>");
        }
        out.flush();
        out.close();
    }
    @RequestMapping("/admin/good/search")
    public String searchGood(Model model,
                             @RequestParam(value = "goodsType",required = false)Integer goodsType,
                             @RequestParam(value = "keyword",required = false)String keyword){
        List<Good> goodList=goodService.searchGood(goodsType,keyword);
        List<GoodsType> goodsTypeList=goodsTypeService.getGoodsTypeList();
        model.addAttribute("goodList",goodList);
        model.addAttribute("goodsTypeList",goodsTypeList);
        return "/admin/mall_goods";
    }
    @RequestMapping("/admin/good/info/{id}")
    public String getGood(@PathVariable("id") Integer id, Model model)
    {
        List<GoodsType> goodsTypeList=goodsTypeService.getGoodsTypeList();
        model.addAttribute("goodsTypeList",goodsTypeList);
        Good good=goodService.getGood(id);

        model.addAttribute("good",good);
        return "/admin/updateGood";
    }
    @RequestMapping("/admin/good/update")
    public void updateGood(@RequestParam("id") Integer id,@RequestParam("goodName") String goodName, @RequestParam("goodsType") Integer goodsType,
                           @RequestParam("goodPrice") Float goodPrice,@RequestParam("goodStore") Integer goodStore,
                           @RequestParam("detail") String detail, @RequestParam("picture") MultipartFile picture,
                           HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println(id);
        System.out.println(goodName);

    PrintWriter   out=response.getWriter();
        if(goodService.updateGood(id,goodName,goodsType,goodPrice,goodStore,detail,picture)){
          String location=request.getContextPath() +"/admin/good/list";
         out.print("<script> alert('更新成功');location.href='"+ location+ "'</script>");
        }else{
         out.print("<script> alert('更新失败');history.go(-1)</script>");
        }
        out.flush();
        out.close();
    }
    @RequestMapping("/admin/good/delete/{ids}")
    public void deleteGood(@PathVariable Integer[] ids,
                           HttpServletRequest request,HttpServletResponse response)throws IOException{
        PrintWriter out=response.getWriter();
        if(ids.length<1){
            out.print("<script>alert('参数异常');history.go(-1)</script>");
        }
        boolean result=goodService.deleteGood(ids);
        if(result==true){
            String location=request.getContextPath()+"/admin/good/list";
            out.print("<script> alert('删除成功');location.href='"+ location+ "'</script>");
        }else{
            out.print("<script> alert('删除异常');history.go(-1)</script>");
        }
        out.flush();
        out.close();
    }
}
