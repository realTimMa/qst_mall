package com.qst.service.impl;

import com.qst.common.Constants;
import com.qst.dao.GoodDao;
import com.qst.entity.Good;
import com.qst.service.GoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
@Service
public class GoodServiceImpl implements GoodService {
    @Autowired
    GoodDao goodDao;
    @Override
    public List<Good> getGoodList() {
        return goodDao.findGoodList();
    }

    @Override
    public boolean saveGood(String goodName, Integer goodsType, Float goodPrice, Integer goodStore, String detail, MultipartFile picture) {
       /*
       * 首先处理图片文件
       * */
        String filename=picture.getOriginalFilename();
        //图片保存文件夹
        File fileDirectory=new File(Constants.FILE_UPLOAD_DIC);
        //创建文件
        File destFile=new File(Constants.FILE_UPLOAD_DIC+filename);
        if(!fileDirectory.exists()){
            if(!fileDirectory.mkdir()){
                return false;
            }
        }
        try {
            picture.transferTo(destFile);
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        if(goodDao.insertGood(goodName,goodPrice,goodStore,detail,Constants.PREFIX+filename,goodsType)>0)
        {
            return true;
        }
        return false;
    }

    @Override
    public List<Good> searchGood(Integer goodsType, String keyword) {
        return goodDao.findGoodListBySearch(goodsType,keyword);
    }

    @Override
    public Good getGood(Integer id) {
        return goodDao.findGoodByPrimaryKey(id);
    }

    @Override
    public boolean updateGood(Integer id, String goodName, Integer goodsType, Float goodPrice, Integer goodStore, String detail, MultipartFile picture) {
        String filename=picture.getOriginalFilename();
        File fileDirectory=new File(Constants.FILE_UPLOAD_DIC);//图片保存的文件夹D:/good-img/
        //创建文件
        File destFile=new File(Constants.FILE_UPLOAD_DIC+filename);//     D:/good-img/img10.png
        try {
            if (!fileDirectory.exists()){
                if(!fileDirectory.mkdir()){
                    return false;
                }
            }
            picture.transferTo(destFile);//另存为
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        if (goodDao.updateGood(id,goodName,goodPrice,goodStore,detail,Constants.PREFIX+filename,goodsType)>0){
            return true;
        }
        return false;

    }

    @Override
    public boolean deleteGood(Integer[] ids) {
       int  i= goodDao.deleteGood(ids);
        if(i>0){
            return true;
        }
        return false;
    }

    @Override
    public Good getGoodDetail(Integer id) {
        return goodDao.findGoodByPrimaryKey(id);
    }


}
