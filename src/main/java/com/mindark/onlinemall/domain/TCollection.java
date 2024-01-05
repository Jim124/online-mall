package com.mindark.onlinemall.domain;

import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;

@Data
public class TCollection implements Serializable {

    @Serial
    private static final long serialVersionUID = -5267892982824580458L;

    private Integer collectionId;
    private Integer postId;
    private Integer customerId;
    private Boolean status;
    private Date createdTime;
    private Date updatedTime;
}
