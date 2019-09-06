package com.buba.Service.serviceimpl;

import com.buba.Service.ForecastService;
import com.buba.bean.Forecast;
import com.buba.mapper.ForecastMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ForecastServiceImpl implements ForecastService {
@Autowired
    private ForecastMapper ft;
    @Override
    public List<Forecast> Byforecast() {
        return ft.Byforecast();
    }
}
