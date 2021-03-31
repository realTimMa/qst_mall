package com.qst.dao;

import com.qst.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface UserDao {
    int insertUser(@Param("realName") String realName,@Param("password") String password,
                       @Param("sex") Integer sex,@Param("phone") String phone,@Param("picture") String picture,
                   @Param("address")String address);

    User loginuser(@Param("phone") String phone,@Param("password") String password);
}
