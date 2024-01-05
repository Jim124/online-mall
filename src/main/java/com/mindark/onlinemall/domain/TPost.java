package com.mindark.onlinemall.domain;

import com.alibaba.fastjson.JSONObject;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;

@Data
public class TPost implements Serializable {

    @Serial
    private static final long serialVersionUID = -5987101924635406403L;
    private Integer postId;
    private Integer customerId;
    private String title;
    private String content;
    private String inventoryUrl;
    private Integer inventoryId;
    private String inventoryName;
    private String inventoryImg;
    private Integer collectionNum;
    private Integer likeNum;
    private Integer commentNum;
    private JSONObject imgUrl;
    private Boolean isDelete;
    private Date createdTime;
    private Date updatedTime;


}
