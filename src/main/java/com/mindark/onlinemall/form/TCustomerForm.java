package com.mindark.onlinemall.form;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;



@Data
public class TCustomerForm  {

    @NotNull(message = "username can be not empty")
    private String username;
    @NotNull(message = "password can be not empty")
    private String password;
    @NotNull(message = "mobile can be not empty")
    @JsonProperty("phone_no")
    private String phoneNo;
    @JsonProperty("profile_img")
    private String profileImg;
}
