package com.qst.service;

import com.qst.entity.AdminUser;

public interface AdminUserService {
    AdminUser  login(String username,String password);
}
