package com.mindark.onlinemall.controller;

import com.mindark.onlinemall.domain.TCustomer;
import com.mindark.onlinemall.exception.GlobalException;
import com.mindark.onlinemall.form.ResetHeadForm;
import com.mindark.onlinemall.form.ResetPasswordForm;
import com.mindark.onlinemall.form.TCustomerForm;
import com.mindark.onlinemall.result.CodeMsg;
import com.mindark.onlinemall.result.Result;
import com.mindark.onlinemall.service.TCustomerService;
import com.mindark.onlinemall.vo.TCustomerVo;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/api/v1/customers")
@Slf4j
public class TCustomerController {

    @Resource
    public TCustomerService tCustomerService;

    @PatchMapping("/updatePass/{token}")
    public Result<Boolean> updatePasswordById(@Valid @RequestBody ResetPasswordForm resetPasswordForm, @PathVariable("token") String token, TCustomer tCustomer){
        if(tCustomer == null){
            throw new GlobalException(CodeMsg.SIGN_IN);
        }
        String tel = tCustomer.getPhoneNo();
        String password = resetPasswordForm.getPassword();
        Boolean res = tCustomerService.updatePassword(token,tel,password);
        return Result.success(res);
    }

    @PatchMapping("/updatePassByForgot/{tel}")
    public Result<Boolean> updatePassByForgotType(@PathVariable("tel")String tel, @Valid @RequestBody ResetPasswordForm resetPasswordForm){
        String password = resetPasswordForm.getPassword();
        log.info("update pass by forgot type:mobile: {}",tel);
        Boolean res = tCustomerService.updatePasswordByForgotType(tel,password);
        return Result.success(res);
    }

    @PostMapping("/create")
    public Result<Boolean> createUser(@RequestBody @Valid TCustomerForm tCustomerForm){
        tCustomerService.save(tCustomerForm);
        return Result.success(true);
    }

    @GetMapping("/")
    public Result<TCustomerVo> findUserByTel(TCustomer tCustomer) {
        if(tCustomer == null){
            throw new GlobalException(CodeMsg.SIGN_IN);
        }
        TCustomerVo tCustomerVo = new TCustomerVo();
        tCustomerVo.setPhoneNo(tCustomer.getPhoneNo());
        tCustomerVo.setProfileImg(tCustomer.getProfileImg());
        tCustomerVo.setUsername(tCustomer.getUsername());
        return Result.success(tCustomerVo);
    }

    @PatchMapping("/updateNickName/{token}/{nickName}")
    public Result<Boolean> updateNickName(@PathVariable String token,@PathVariable String nickName,TCustomer tCustomer){
        if(tCustomer == null){
            throw new GlobalException(CodeMsg.SIGN_IN);
        }
        tCustomerService.updateNickName(token,tCustomer.getPhoneNo(),nickName);
        return Result.success(true);
    }

    @PatchMapping("/updateHead/{token}")
    public Result<Boolean> updateHead(@PathVariable String token, @RequestBody @Valid ResetHeadForm resetHeadForm, TCustomer tCustomer){
        if(tCustomer == null){
            throw new GlobalException(CodeMsg.SIGN_IN);
        }
        String head = resetHeadForm.getProfileImg();
        tCustomerService.updateAvatar(token,tCustomer.getPhoneNo(),head);
        return Result.success(true);
    }

    @GetMapping("/{id}")
    public Result<TCustomerVo> getById(@PathVariable("id")Integer id){
        TCustomerVo tCustomer = tCustomerService.getById(id);
        return Result.success(tCustomer);
    }

    @PatchMapping("/add-following/{customerId}")
    public Result<TCustomerVo> addFollowing(TCustomer tCustomer,@PathVariable("customerId")Integer customerId){
        if(tCustomer == null){
            throw new GlobalException(CodeMsg.SIGN_IN);
        }
        TCustomerVo tCustomerVo = tCustomerService.addFollowing(customerId);
        return Result.success(tCustomerVo);
    }

    @PatchMapping("/minus-following/{customerId}")
    public Result<TCustomerVo> minusFollowing(TCustomer tCustomer,@PathVariable("customerId")Integer customerId){
        if(tCustomer == null){
            throw new GlobalException(CodeMsg.SIGN_IN);
        }
        TCustomerVo tCustomerVo = tCustomerService.minusFollowing(customerId);
        return Result.success(tCustomerVo);
    }

    @PatchMapping("/add-follower/{customerId}")
    public Result<TCustomerVo> addFollower(TCustomer tCustomer,@PathVariable("customerId")Integer customerId){
        if(tCustomer == null){
            throw new GlobalException(CodeMsg.SIGN_IN);
        }
        TCustomerVo tCustomerVo = tCustomerService.addFollower(customerId);
        return Result.success(tCustomerVo);
    }

    @PatchMapping("/minus-follower/{customerId}")
    public Result<TCustomerVo> minusFollower(TCustomer tCustomer,@PathVariable("customerId")Integer customerId){
        if(tCustomer == null){
            throw new GlobalException(CodeMsg.SIGN_IN);
        }
        TCustomerVo tCustomerVo = tCustomerService.minusFollower(customerId);
        return Result.success(tCustomerVo);
    }




}
