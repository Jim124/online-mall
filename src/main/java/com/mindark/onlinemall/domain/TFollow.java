package com.mindark.onlinemall.domain;

import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;

@Data
public class TFollow implements Serializable {

    @Serial
    private static final long serialVersionUID = -5613417994056397905L;

    private Integer followId;
    private Integer followeeId;
    private Integer followedId;
    private Boolean status;
    private Date createdTime;
    private Date updatedTime;

}
