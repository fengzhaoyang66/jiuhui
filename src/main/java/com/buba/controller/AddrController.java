package com.buba.controller;

import com.buba.Service.AddressService;
import com.buba.bean.Address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class AddrController {
    @Autowired
    private AddressService addrService;
    @RequestMapping("/treeInfo")
    @ResponseBody
    public List<Address> treeInfo() {

        return addrService.selTreeInfo();
    }
}
