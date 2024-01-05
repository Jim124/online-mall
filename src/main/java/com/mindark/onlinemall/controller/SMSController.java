package com.mindark.onlinemall.controller;


import com.mindark.onlinemall.exception.GlobalException;
import com.mindark.onlinemall.form.SMSValidateForm;
import com.mindark.onlinemall.redis.RedisService;
import com.mindark.onlinemall.redis.SMSKey;
import com.mindark.onlinemall.result.CodeMsg;
import com.mindark.onlinemall.result.Result;
import com.mindark.onlinemall.sms.SMSConfig;
import com.mindark.onlinemall.sms.SMSService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/sms")
public class SMSController {

    @Resource
    SMSService smsService;
    @Resource
    RedisService redisService;

    @Resource
    SMSConfig smsConfig;

    @GetMapping ("/send/{type}/{mobile}")
    public Result<Boolean> sendMsg(@PathVariable("type")String type, @PathVariable String mobile){
        // check message limit
        Integer maxCount = redisService.get(SMSKey.smsLimit,mobile,Integer.class);
        if(maxCount != null) {
            if(maxCount > smsConfig.getMaxCount()) {
                throw new GlobalException(CodeMsg.SMS_CODE_LIMIT);
            }
        }
        Boolean result = smsService.sendSMS(type,mobile);
        return Result.success(result);
    }

    /**
     *  type 1 register send msgCode
     *  type 2 reset password msgCode
     *  type 3 forgot password
     */
    @PostMapping("/verify/mobile/{type}")
    public Result<Boolean> validateCode(@PathVariable("type")String type,@RequestBody SMSValidateForm validateForm){
        Boolean result = smsService.verifyCode(type,validateForm);
        return Result.success(result);
    }

}
