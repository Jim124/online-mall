package com.mindark.onlinemall.dao;

import com.mindark.onlinemall.domain.TInventory;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TInventoryDao {
    TInventory selectTInventoryById(TInventory tInventory);
}
