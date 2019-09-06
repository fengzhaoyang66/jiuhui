package com.buba.Service.serviceimpl;

import com.buba.Service.ReportingService;
import com.buba.bean.Reporting;
import com.buba.mapper.ReportingMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReportingServiceImpl implements ReportingService {
    @Autowired
    private ReportingMapper reportingMapper;
    @Override
    public List<Reporting> getAll() {
        return reportingMapper.getAll();
    }
}
