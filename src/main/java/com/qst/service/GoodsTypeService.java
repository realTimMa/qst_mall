package com.qst.service;

import com.qst.entity.GoodsType;

import java.util.List;

public interface GoodsTypeService {
    List<GoodsType> getGoodsTypeList();

    int addGoodsType(String typename, String releaseTime, Integer auditStatus);

    int auditApproved(Integer id);
    int auditCancel(Integer id);

    int deleteGoodsType(Integer id);

    GoodsType getGoodsType(Integer id);

    int updateGoodsType(Integer id, String typename, String releaseTime, Integer auditStatus);

    boolean deleteGoodsTypeBatch(Integer[] ids);
}
