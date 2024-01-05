package com.mindark.onlinemall.domain;

import com.alibaba.fastjson.JSONObject;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Data
public class TInventory implements Serializable {
    @Serial
    private static final long serialVersionUID = 3878338972066287203L;
    private Integer inventoryId;
    private Integer categoryId;
    private Integer brandId;
    private Integer spgId;
    private String title;
    private String subtitle;
    private JSONObject images;
    private BigDecimal price;
    private JSONObject param;
    private Integer stock;
    private String unit;
    private Integer soldQuantity;
    private Boolean saleable;
    private Boolean isDelete;
    private BigDecimal weight;
    private Integer subCategoryId;
    private Date createdTime;
    private Date updatedTime;

}
