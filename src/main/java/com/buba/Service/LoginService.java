package com.buba.Service;

import com.buba.bean.User;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface LoginService {
    List<User>FindBy(String codename,String name);
}
