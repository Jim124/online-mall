package com.mindark.onlinemall.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class TCustomerVo {
    private Integer customerId;
    private String username;
    private String profileImg;
    private String phoneNo;
    private Integer followingNum;
    private Integer followerNum;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createdTime;
}
