package com.mindark.onlinemall.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;

@Data
public class TComment implements Serializable {
    @Serial
    private static final long serialVersionUID = 9188572219990037883L;
    private Integer commentId;
    private Integer postId;
    private Integer customerId;
    private String content;
    private Integer parentId;
    private Integer likeNum;
    private Boolean isAuthor;
    private Boolean isDelete;
    private Date createdTime;
    private Date updatedTime;


}
