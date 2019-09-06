package com.buba.controller;

import com.buba.Service.ReportingService;
import com.buba.bean.Reporting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ReportingController {
    @Autowired
    private ReportingService reportingService;
    @RequestMapping("getAll")
    @ResponseBody
    public List <Reporting> getAll(){
        List<Reporting> all = reportingService.getAll();

        return all;
    }
}
