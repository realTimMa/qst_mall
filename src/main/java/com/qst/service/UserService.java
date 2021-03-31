package com.qst.service;

import com.qst.entity.User;
import org.springframework.web.multipart.MultipartFile;

public interface UserService {
    boolean saveUser(String realName, String password, Integer sex, String phone, MultipartFile picture,String address);

    User loginuser(String phone, String password);
}
