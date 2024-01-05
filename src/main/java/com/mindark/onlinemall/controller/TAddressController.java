package com.mindark.onlinemall.controller;

import com.mindark.onlinemall.domain.TCustomer;
import com.mindark.onlinemall.exception.GlobalException;
import com.mindark.onlinemall.form.TAddressForm;
import com.mindark.onlinemall.result.CodeMsg;
import com.mindark.onlinemall.result.Result;
import com.mindark.onlinemall.service.TAddressService;
import com.mindark.onlinemall.vo.TAddressVo;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/addresses")
public class TAddressController {

    @Resource
    TAddressService tAddressService;

    @PostMapping("/")
    public Result<Boolean> createAddress(@Valid @RequestBody TAddressForm tAddressForm, TCustomer tCustomer){
        if(tCustomer == null) {
            throw new GlobalException(CodeMsg.SIGN_IN);
        }
        tAddressForm.setCustomerId(tCustomer.getCustomerId());
        tAddressService.createAddress(tAddressForm);
        return Result.success(true);
    }
    @GetMapping("/")
    public Result<List<TAddressVo>> getCustomerAddresses(TCustomer tCustomer){
        if(tCustomer == null) {
            throw new GlobalException(CodeMsg.SIGN_IN);
        }
        List<TAddressVo> tAddressVos = tAddressService.getCustomerAddresses(tCustomer.getCustomerId());
        return Result.success(tAddressVos);
    }

    @PatchMapping("/{addressId}")
    public Result<Boolean> updateCustomerAddress(@PathVariable("addressId")Integer addressId,TCustomer tCustomer,@RequestBody TAddressForm tAddressForm){
        if(tCustomer == null) {
            throw new GlobalException(CodeMsg.SIGN_IN);
        }

        tAddressForm.setCustomerId(tCustomer.getCustomerId());
        tAddressService.updateCustomerAddress(tAddressForm,addressId);
        return Result.success(true);
    }

    @DeleteMapping("/{addressId}")
    public Result<Boolean> deleteAddress(@PathVariable("addressId")Integer addressId,TCustomer tCustomer){
        if(tCustomer == null) {
            throw new GlobalException(CodeMsg.SIGN_IN);
        }
        tAddressService.deleteAddress(addressId);
        return Result.success(true);
    }

    @GetMapping("/{addressId}")
    public Result<TAddressVo> getAddressDetail(@PathVariable("addressId")Integer addressId,TCustomer tCustomer){
        if(tCustomer == null) {
            throw new GlobalException(CodeMsg.SIGN_IN);
        }
        TAddressVo tAddressVo = tAddressService.getAddressByAddressId(addressId);
        return Result.success(tAddressVo);
    }

}
