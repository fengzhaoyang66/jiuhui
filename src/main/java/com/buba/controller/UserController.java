package com.buba.controller;

import com.buba.Service.LoginService;
import com.buba.bean.User;
import com.buba.mapper.LoginMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("UseCon")

public class UserController {

    @Autowired
    private LoginService loginService;

    //登陆功能
    @RequestMapping("/login")
    @ResponseBody
    public List<User>  login(String codename, String password, HttpSession session){
        List<User> user =loginService.FindBy(codename,password);

        ModelAndView success =new ModelAndView();
        if(user.size()>0) {
            session.setAttribute("User",user);
           // success.setViewName("success");

        }
        return user;
    }
}
