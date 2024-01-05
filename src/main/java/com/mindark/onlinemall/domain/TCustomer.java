package com.mindark.onlinemall.domain;

import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;

@Data
public class TCustomer implements Serializable {

    @Serial
    private static final long serialVersionUID = -6193613604595283089L;
    private Integer customerId;
    private String username;
    private String password;
    private String profileImg;
    private String phoneNo;
    private Integer followingNum;
    private Integer followerNum;
    private Date createdTime;
    private Date updatedTime;



}
