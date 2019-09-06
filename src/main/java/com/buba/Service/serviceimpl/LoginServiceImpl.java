package com.buba.Service.serviceimpl;


import com.buba.Service.LoginService;
import com.buba.bean.User;

import com.buba.mapper.LoginMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    private LoginMapper loginMapper;

    @Override
    public List<User> FindBy(String codename, String password) {
        return loginMapper.FindBy(codename, password);
    }
}
