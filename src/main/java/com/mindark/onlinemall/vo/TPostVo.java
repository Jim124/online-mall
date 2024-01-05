package com.mindark.onlinemall.vo;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class TPostVo {

    private Integer postId;
    private Integer customerId;
    private String title;
    private String content;
    private String inventoryUrl;
    private Integer inventoryId;
    private String inventoryName;
    private Integer collectionNum;
    private Integer likeNum;
    private Integer commentNum;
    private JSONObject imgUrl;
    private Boolean isDelete;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createdTime;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updatedTime;

}
