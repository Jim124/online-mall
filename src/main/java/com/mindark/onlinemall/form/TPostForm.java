package com.mindark.onlinemall.form;

import com.alibaba.fastjson.JSONObject;
import lombok.Data;

@Data
public class TPostForm {
    private Integer customerId;
    private String title;
    private String content;
    private String inventoryUrl;
    private Integer inventoryId;
    private String inventoryName;
    private String inventoryImg;
    private JSONObject imgUrl;

    private String searchCriteria;
}
