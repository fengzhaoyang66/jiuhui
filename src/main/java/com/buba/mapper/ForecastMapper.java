package com.buba.mapper;

import com.buba.bean.Forecast;
import org.springframework.stereotype.Component;

import java.util.List;
@Component
public interface ForecastMapper {
  public List<Forecast>Byforecast();
}
