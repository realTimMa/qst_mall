package com.qst.dao;


import com.qst.entity.GoodsType;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
@Mapper
public interface GoodsTypeDao {
    List<GoodsType> findGoodsTypeList();
    int insertGoodsType(GoodsType goodsType);
    int auditApproved(Integer id);
    int auditCancel(Integer id);

    int deleteGoodsTypeByPrimaryKey(Integer id);

    GoodsType findGoodsTypeByPrimary(Integer id);

    int updateGoodsTypeByPrimaryKey(GoodsType goodsType);

    int deleteGoodsTypeBatch(Integer[] ids);
}
