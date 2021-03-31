package com.qst.service.impl;

import com.qst.dao.GoodsTypeDao;
import com.qst.entity.GoodsType;
import com.qst.service.GoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.SimpleFormatter;

@Service
public class GoodsTypeServiceImpl implements GoodsTypeService {
    @Autowired
    GoodsTypeDao goodsTypeDao;

    @Override
    public List<GoodsType> getGoodsTypeList(){
        return goodsTypeDao.findGoodsTypeList();
    }

    @Override
    public int addGoodsType(String typename, String time, Integer auditStatus) {
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        Date releaseTime=null;
        try {
            releaseTime=format.parse(time);
        }catch (ParseException e){
            e.printStackTrace();
        }
        GoodsType newGoodsType=new GoodsType();
        newGoodsType.setTypename(typename);
        newGoodsType.setReleaseTime(releaseTime);
        newGoodsType.setAuditStatus(auditStatus);
        return goodsTypeDao.insertGoodsType(newGoodsType);
    }

    @Override
    public int auditApproved(Integer id) {
        return goodsTypeDao.auditApproved(id);
    }

    @Override
    public int auditCancel(Integer id) {
        return goodsTypeDao.auditCancel(id);
    }

    @Override
    public int deleteGoodsType(Integer id) {
        return goodsTypeDao.deleteGoodsTypeByPrimaryKey(id);
    }

    @Override
    public GoodsType getGoodsType(Integer id) {
        return goodsTypeDao.findGoodsTypeByPrimary(id);


    }

    @Override
    public int updateGoodsType(Integer id, String typename, String time, Integer auditStatus) {
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        Date releaseTime=null;
        try {
            releaseTime=format.parse(time);
        }catch (ParseException e){
            e.printStackTrace();
        }
        GoodsType goodsType=new GoodsType();
        goodsType.setId(id);
        goodsType.setTypename(typename);
        goodsType.setReleaseTime(releaseTime);
        goodsType.setAuditStatus(auditStatus);
       return goodsTypeDao.updateGoodsTypeByPrimaryKey(goodsType);
    }

    @Override
    public boolean deleteGoodsTypeBatch(Integer[] ids) {
   int i=   goodsTypeDao.deleteGoodsTypeBatch(ids);
     if(i>0)
     {
         return true;
     }
     else{
         return false;
     }

    }
}
