package com.mindark.onlinemall.controller;

import com.mindark.onlinemall.domain.TCustomer;
import com.mindark.onlinemall.domain.TFollow;
import com.mindark.onlinemall.exception.GlobalException;
import com.mindark.onlinemall.form.TFollowForm;
import com.mindark.onlinemall.result.CodeMsg;
import com.mindark.onlinemall.result.Result;
import com.mindark.onlinemall.service.TFollowService;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/follow")
public class TFollowController {

    @Resource
    TFollowService tFollowService;

    @GetMapping("/following/{customerId}")
    public Result<List<TFollow>> getFollowingListByCustomerId(@PathVariable("customerId") Integer customerId){
        List<TFollow> followingList = tFollowService.getFollowingListByCustomerId(customerId);
        return Result.success(followingList);
    }

    @GetMapping("/follower/{customerId}")
    public Result<List<TFollow>> getFollowerListByCustomerId(@PathVariable("customerId") Integer customerId){
        List<TFollow> followerList = tFollowService.getFollowerListByCustomerId(customerId);
        return Result.success(followerList);
    }

    @PostMapping("/create")
    public Result<Boolean> createFollow(@Valid @RequestBody TFollowForm tFollowForm, TCustomer tCustomer){
        if(tCustomer == null) {
            throw new GlobalException(CodeMsg.SIGN_IN);
        }
        tFollowForm.setFolloweeId(tCustomer.getCustomerId());
        tFollowService.createFollow(tFollowForm);
        return Result.success(true);
    }
}
