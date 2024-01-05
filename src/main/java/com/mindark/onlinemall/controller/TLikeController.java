package com.mindark.onlinemall.controller;


import com.mindark.onlinemall.domain.TCustomer;
import com.mindark.onlinemall.exception.GlobalException;
import com.mindark.onlinemall.form.TLikeForm;
import com.mindark.onlinemall.result.CodeMsg;
import com.mindark.onlinemall.result.Result;
import com.mindark.onlinemall.service.TLikeService;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/like")
public class TLikeController {

    @Resource
    TLikeService tLikeService;

    @PostMapping("/create")
    public Result<Boolean> createLike(@Valid @RequestBody TLikeForm tLikeForm, TCustomer tCustomer) {
        if (tCustomer == null) {
            throw new GlobalException(CodeMsg.SIGN_IN);
        }
        tLikeForm.setCustomerId(tCustomer.getCustomerId());
        tLikeService.createLike(tLikeForm, tCustomer);
        return Result.success(true);
    }
}
