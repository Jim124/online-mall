package com.mindark.onlinemall.domain;

import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;

@Data
public class TLike implements Serializable {
    @Serial
    private static final long serialVersionUID = -4994629209558508192L;

    private Integer likeId;
    private Integer customerId;
    private Integer postId;
    private Integer commentId;
    private Boolean status;  //点赞状态：0.取消点赞 1.已点赞
    private Integer type; //点赞种类：1.帖子 2.留言
    private Date createdTime;
    private Date updatedTime;
}
