package com.mindark.onlinemall.controller;

import com.mindark.onlinemall.domain.TCustomer;
import com.mindark.onlinemall.exception.GlobalException;
import com.mindark.onlinemall.form.TCollectionForm;
import com.mindark.onlinemall.result.CodeMsg;
import com.mindark.onlinemall.result.Result;
import com.mindark.onlinemall.service.TCollectionService;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/collection")
public class TCollectionController {
    @Resource
    TCollectionService tCollectionService;

    @PostMapping("/create")
    public Result<Boolean> createCollection(@Valid @RequestBody TCollectionForm tCollectionForm, TCustomer tCustomer) {
        if (tCustomer == null) {
            throw new GlobalException(CodeMsg.SIGN_IN);
        }
        tCollectionForm.setCustomerId(tCustomer.getCustomerId());
        tCollectionService.createCollection(tCollectionForm, tCustomer);
        return Result.success(true);
    }
}
