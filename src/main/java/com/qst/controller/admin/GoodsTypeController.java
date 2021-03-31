package com.qst.controller.admin;


import com.qst.entity.GoodsType;
import com.qst.service.GoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
public class GoodsTypeController {

    @Autowired
    GoodsTypeService goodsTypeService;

    @RequestMapping("/admin/goodsType/list")
    public String getGoodsTypeList(Model model){
        List<GoodsType> goodsTypeList=goodsTypeService.getGoodsTypeList();
        model.addAttribute("goodTypeList",goodsTypeList);
        return "/admin/mall_goods_type";
    }

    @RequestMapping(value = "/admin/goodsType/add",method = RequestMethod.POST)
    public void addGoodsType(String typename, String releaseTime, Integer auditStatus,
                             HttpServletResponse response,HttpServletRequest request) throws IOException {
        PrintWriter out=response.getWriter();
        int i=goodsTypeService.addGoodsType(typename,releaseTime,auditStatus);
        if (i>0){
            String location=request.getContextPath()+"/admin/goodsType/list";
            out.print("<script> alert('添加成功');location.href='"+location+"'</script>");
        }
        else{
        out.print("<script> alert('添加失败');history.go(-1)</script>");
        }
        out.flush();
        out.close();

    }
    @RequestMapping("/admin/goodsType/audit/approved/{id}")
    public String goodsTypeAuditApproved(@PathVariable("id") Integer id){
       int i= goodsTypeService.auditApproved(id);
       return "redirect:/admin/goodsType/list";

    }
    @RequestMapping("/admin/goodsType/audit/cancel/{id}")
    public String goodsTypeAuditCancel(@PathVariable("id") Integer id){
        int i= goodsTypeService.auditCancel(id);
        return "redirect:/admin/goodsType/list";
    }
    /*@RequestMapping("/admin/goodsType/delete/{id}")
    public void deleteGoodsType(@PathVariable("id") Integer id,
                                HttpServletResponse response,HttpServletRequest request) throws IOException {
        PrintWriter out=response.getWriter();
        int i=goodsTypeService.deleteGoodsType(id);
        if (i>0){
            String location=request.getContextPath()+"/admin/goodsType/list";
            out.print("<script> alert('删除成功');location.href='"+location+"'</script>");
        }
        else{
            out.print("<script> alert('删除失败');history.go(-1)</script>");
        }
        out.flush();
        out.close();
    }*/
    @RequestMapping("/admin/goodsType/info/{id}")
    public String getGoodsType(@PathVariable("id") Integer id,Model model){
        GoodsType goodsType=  goodsTypeService.getGoodsType(id);
        model.addAttribute("goodsType",goodsType);
        return "/admin/updateGoodsType";
    }
    @RequestMapping("/admin/goodsType/update")
    public void updateGoodsType(@RequestParam("id")Integer id,@RequestParam("typename") String typename,
                                @RequestParam("releaseTime")String releaseTime,@RequestParam("auditStatus")Integer auditStatus,
                                HttpServletResponse response,HttpServletRequest request) throws IOException {
        PrintWriter out=response.getWriter();
     int i=   goodsTypeService.updateGoodsType(id,typename,releaseTime,auditStatus);
        if (i>0){
            String location=request.getContextPath()+"/admin/goodsType/list";
            out.print("<script> alert('更新成功');location.href='"+location+"'</script>");
        }
        else{
            out.print("<script> alert('更新失败');history.go(-1)</script>");
        }
        out.flush();
        out.close();
    }
    @RequestMapping("admin/goodsType/delete/{ids}")
    public void deleteGoodsType(@PathVariable Integer[] ids,HttpServletResponse response,HttpServletRequest request) throws IOException {
        PrintWriter out=response.getWriter();
        if(ids.length<1)
        {
            out.print("<script> alert('参数异常');history.go(-1)</script>");
        }
        boolean result=   goodsTypeService.deleteGoodsTypeBatch(ids);
        if(result==true){
            String location=request.getContextPath()+"/admin/goodsType/list";
            out.print("<script> alert('删除成功');location.href='"+location+"'</script>");
        }
        else{
            out.print("<script> alert('删除异常');history.go(-1)</script>");
        }
        out.flush();
        out.close();
    }

}
