package com.mindark.onlinemall.form;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class TCommentForm {

    private Integer postId;
    private Integer customerId;
    private String content;
    private Integer parentId;
}
