package com.buba.mapper;

import com.buba.bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface LoginMapper {
    List<User> FindBy(@Param("codename") String codename, @Param("password")String name);
}

