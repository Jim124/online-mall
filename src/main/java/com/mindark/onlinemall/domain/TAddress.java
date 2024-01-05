package com.mindark.onlinemall.domain;

import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;

@Data
public class TAddress implements Serializable {
    @Serial
    private static final long serialVersionUID = -5506251598023545021L;
    private Integer addressId;
    private Integer customerId;
    private Integer stateId;
    private String name;
    private String phoneNo;
    private String address;
    private String zipCode;
    private String cityName;
    private Boolean isDefault;
    private Date createdTime;
    private Date updatedTime;

   
}
