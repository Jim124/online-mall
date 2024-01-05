package com.mindark.onlinemall.controller;

import com.mindark.onlinemall.domain.TInventory;
import com.mindark.onlinemall.result.Result;
import com.mindark.onlinemall.service.TInventoryService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/inventories")
public class TInventoryController {

    @Resource
    TInventoryService tInventoryService;

    @GetMapping("/{inventoryId}")
    public Result<TInventory> getInventoryById(@PathVariable("inventoryId")Integer inventoryId){
        TInventory tInventory = tInventoryService.getTInventoryById(inventoryId);
        return Result.success(tInventory);
    }
}
