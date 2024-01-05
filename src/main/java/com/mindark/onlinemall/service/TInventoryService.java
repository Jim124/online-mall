package com.mindark.onlinemall.service;

import com.mindark.onlinemall.dao.TInventoryDao;
import com.mindark.onlinemall.domain.TInventory;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

@Service
public class TInventoryService {

    @Resource
    TInventoryDao tInventoryDao;


    public TInventory getTInventoryById(Integer id){
        TInventory tInventory = new TInventory();
        tInventory.setInventoryId(id);
        return tInventoryDao.selectTInventoryById(tInventory);
    }

}
