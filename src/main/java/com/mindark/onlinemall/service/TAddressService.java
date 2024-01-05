package com.mindark.onlinemall.service;

import com.mindark.onlinemall.dao.TAddressDao;
import com.mindark.onlinemall.domain.TAddress;
import com.mindark.onlinemall.form.TAddressForm;
import com.mindark.onlinemall.vo.TAddressVo;
import jakarta.annotation.Resource;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class TAddressService {

    @Resource
    TAddressDao tAddressDao;

    public void createAddress(TAddressForm tAddressForm) {
        TAddress tAddress = new TAddress();
        BeanUtils.copyProperties(tAddressForm,tAddress);
        if(tAddress.getIsDefault() == true){
            tAddressDao.updatedCustomerAddressByCustomerId(tAddress.getCustomerId());
        }
        tAddressDao.insertData(tAddress);
    }

    public List<TAddressVo> getCustomerAddresses(Integer customerId) {
        return tAddressDao.getCustomerAddressesByCustomerId(customerId);
    }

    public void updateCustomerAddress(TAddressForm tAddressForm,Integer addressId) {
        TAddress tAddress = new TAddress();
        BeanUtils.copyProperties(tAddressForm,tAddress);
        tAddress.setAddressId(addressId);
        tAddress.setUpdatedTime(new Date());
        Boolean isDefault = tAddress.getIsDefault();
        if(isDefault != null && isDefault == true){
            tAddressDao.updatedCustomerAddressByCustomerId(tAddress.getCustomerId());
        }
        tAddressDao.updateAddressByAddressId(tAddress);
    }

    public void deleteAddress(Integer addressId) {
        tAddressDao.deleteAddressByAddressId(addressId);
    }

    public TAddressVo getAddressByAddressId(Integer addressId) {
        return tAddressDao.getAddressDetail(addressId);
    }
}
