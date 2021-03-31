package com.qst.dao;

import com.qst.entity.Good;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
@Mapper
public interface GoodDao {
    List<Good> findGoodList();

    int insertGood(@Param("goodName") String goodName, @Param("goodPrice") Float goodPrice,
                   @Param("goodStore") Integer goodStore, @Param("detail") String detail,
                   @Param("picture") String picture,
                   @Param("goodsType") Integer goodsType);

    List<Good> findGoodListBySearch(@Param("goodsType") Integer goodsType,@Param("keyword") String keyword);

    Good selectGoodByPrimaryKey(@Param("id") Integer id);

    int updateGood(@Param("id") Integer id,@Param("goodName") String goodName, @Param("goodPrice") Float goodPrice,
                   @Param("goodStore") Integer goodStore, @Param("detail") String detail,
                   @Param("picture") String picture,
                   @Param("goodsType") Integer goodsType);

    int deleteGood(Integer[] ids);

    Good findGoodByPrimaryKey(@Param("id") Integer id);
}
