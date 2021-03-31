package com.qst.dao;

import com.qst.entity.AdminUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface AdminUserDao {

    AdminUser login(@Param("username") String username, @Param("password") String password);
}
