package com.qst.service.impl;

import com.qst.dao.AdminUserDao;
import com.qst.entity.AdminUser;
import com.qst.service.AdminUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("AdminUserService")
public class AdminUserServiceImpl implements AdminUserService {
    @Autowired
    AdminUserDao adminUserDao;

    @Override
    public AdminUser login(String username,String password) {
        return   adminUserDao.login(username,password);
    }
}
