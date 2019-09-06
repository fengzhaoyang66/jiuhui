package com.buba.Service.serviceimpl;

import com.buba.Service.AddressService;
import com.buba.bean.Address;
import com.buba.mapper.AddressMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AddressImpl implements AddressService {
    @Autowired
    private AddressMapper addressMapper;
    @Override
    public List<Address> selTreeInfo() {
        return addressMapper.selTreeInfo();
    }
}
