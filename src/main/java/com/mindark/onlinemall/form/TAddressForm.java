package com.mindark.onlinemall.form;

import lombok.Data;


@Data
public class TAddressForm {

    private Integer customerId;
    private Integer stateId;
    private String name;
    private String phoneNo;
    private String zipCode;
    private String address;
    private String cityName;
    private Boolean isDefault;
}
