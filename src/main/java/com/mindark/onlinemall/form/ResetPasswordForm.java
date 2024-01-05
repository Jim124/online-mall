package com.mindark.onlinemall.form;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class ResetPasswordForm {
    @NotNull(message = "password can be not empty!")
    private String password;



}
