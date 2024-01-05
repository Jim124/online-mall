package com.mindark.onlinemall.form;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class ResetHeadForm {
    @NotNull(message = "image address can be not empty!")
    private String profileImg;
}
