package com.mindark.onlinemall.vo;

import lombok.Data;

@Data
public class TAddressVo {
    private Integer addressId;
    private Integer customerId;
    private String stateName;
    private String name;
    private String phoneNo;
    private String cityName;
    private String address;
    private String zipCode;
    private Boolean isDefault;

}
