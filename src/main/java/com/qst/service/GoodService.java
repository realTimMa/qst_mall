package com.qst.service;

import com.qst.entity.Good;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface GoodService {
    List<Good> getGoodList();

    boolean saveGood(String goodName, Integer goodsType, Float goodPrice, Integer goodStore, String detail, MultipartFile picture);


    List<Good> searchGood(Integer goodsType, String keyword);

    Good getGood(Integer id);

    boolean updateGood(Integer id, String goodName, Integer goodsType, Float goodPrice, Integer goodStore, String detail, MultipartFile picture);

    boolean deleteGood(Integer[] ids);

    Good getGoodDetail(Integer id);
}
