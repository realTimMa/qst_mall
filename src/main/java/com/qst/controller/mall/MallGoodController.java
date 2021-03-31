package com.qst.controller.mall;

import com.qst.entity.Good;
import com.qst.entity.GoodsType;
import com.qst.service.GoodService;
import com.qst.service.GoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class MallGoodController {
    @Autowired
    GoodService goodService;
    @Autowired
    GoodsTypeService goodsTypeService;
    @RequestMapping("/good/search")
    public String searchGood(Model model,
                             @RequestParam(value = "goodsType",required = false)Integer goodsType){
        List<Good> goodList=goodService.searchGood(goodsType,null);
        List<GoodsType> goodsTypeList=goodsTypeService.getGoodsTypeList();
        model.addAttribute("goodList",goodList);
        model.addAttribute("goodsTypeList",goodsTypeList);
        return "/goodList";
    }
    @RequestMapping("/good/detail")
    public String goodDetail(Model model,@RequestParam("id")Integer id){
        Good good=goodService.getGoodDetail(id);
        List<GoodsType> goodsTypeList=goodsTypeService.getGoodsTypeList();
        model.addAttribute("good",good);
        model.addAttribute("goodsTypeList",goodsTypeList);
        return "/goodDetail";
    }

}
