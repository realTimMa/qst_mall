package com.qst.service.impl;

import com.qst.common.Constants;
import com.qst.dao.UserDao;
import com.qst.entity.User;
import com.qst.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;
    @Override
    public boolean saveUser(String realName, String password, Integer sex, String phone, MultipartFile picture,String address) {

        String filename=picture.getOriginalFilename();
        File fileDirectory=new File(Constants.FILE_UPLOAD_DIC1);//图片保存的文件夹D:/good-img/
        //创建文件
        File destFile=new File(Constants.FILE_UPLOAD_DIC1+filename);//     D:/good-img/img10.png
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
        if(userDao.insertUser(realName,password,sex,phone,Constants.PREFIX1+filename,address)>0)
        {
            return true;
        }
        return false;
    }

    @Override
    public User loginuser(String phone, String password) {
        return userDao.loginuser(phone,password);
    }
}
