package com.buba.controller;

import com.buba.Service.ForecastService;
import com.buba.bean.Forecast;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
@Controller
@RequestMapping("/forecast")
public class ForecastController {
    @Autowired
    private ForecastService fs;
    @RequestMapping("/Byforecast")
    @ResponseBody
    public List<Forecast> Byforecast(){
        List<Forecast> list=fs.Byforecast();
        return list;
    }
}
