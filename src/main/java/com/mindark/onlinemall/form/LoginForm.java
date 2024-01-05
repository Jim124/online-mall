package com.mindark.onlinemall.form;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

@Data
public class LoginForm {
    @NotNull(message = "mobile can be not empty")
    @JsonProperty("phone_no")
    private String phoneNo;
    @NotNull(message = "password can be not empty")
    @Length(min = 8)
    private String password;
}
