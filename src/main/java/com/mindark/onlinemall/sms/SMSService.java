package com.mindark.onlinemall.sms;


import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;

import com.mindark.onlinemall.dao.TCustomerDao;
import com.mindark.onlinemall.domain.TCustomer;
import com.mindark.onlinemall.enums.SMSEnum;
import com.mindark.onlinemall.exception.GlobalException;
import com.mindark.onlinemall.form.SMSValidateForm;
import com.mindark.onlinemall.redis.RedisService;
import com.mindark.onlinemall.redis.SMSKey;
import com.mindark.onlinemall.result.CodeMsg;
import com.mindark.onlinemall.util.UUIDUtil;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.net.URLDecoder;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Random;

@Service
@Slf4j
public class SMSService {

    @Resource
    SMSConfig smsConfig;
    @Resource
    TCustomerDao tCustomerDao;

    @Resource
    RedisService redisService;
    public  Boolean sendSMS(String type,String mobileNumber)  {
        // check the mobile is existed when reset the password or forgot the password.
        if(StringUtils.equals(type, SMSEnum.RESET.getCode()) || StringUtils.equals(type,SMSEnum.FORGOT.getCode())){
            TCustomer tCustomer = tCustomerDao.getByTel(mobileNumber);
            if(tCustomer == null){
                throw  new GlobalException(CodeMsg.MOBILE_NOT_EXIST);
            }
        }

        // check the mobile is existed when register
        if(StringUtils.equals(type,SMSEnum.REGISTER.getCode())){
            TCustomer tCustomer = tCustomerDao.getByTel(mobileNumber);
            if(tCustomer != null){
                throw  new GlobalException(CodeMsg.MOBILE_EXIST);
            }
        }

        // 随机的四位数OTP
        Random random = new Random();
        int OTPNumber = random.nextInt(9000) + 1000;
        String messageContent = smsConfig.getContent() + OTPNumber;
        if(mobileNumber.startsWith("86")){
            messageContent = smsConfig.getChinaContent().replace("%%",OTPNumber+"");
        }
        //String messageContent = smsConfig.getContent() + OTPNumber;
        // 自动生成一个 referenceID
        String referenceID = UUIDUtil.uuid();
        String param = "apiKey=" + smsConfig.getApiKey()
                + "&messageContent=" + messageContent
                + "&recipients=" + mobileNumber
                + "&referenceID=" + referenceID;
        RestTemplate restTemplate = new RestTemplate();
        String url =  smsConfig.getUrl() + param;
        url = URLDecoder.decode(url, Charset.forName(StandardCharsets.UTF_8.name()));
        String result = restTemplate.getForObject(url, String.class);
        log.info("receive msg result:{}",result);
        JSONObject resultObj = JSON.parseObject(result);
        String status = (String)resultObj.get("status");
        if(StringUtils.equals("ok",status)) {
            Integer count = redisService.get(SMSKey.smsLimit,mobileNumber,Integer.class);
            if(count != null) {
                redisService.incr(SMSKey.smsLimit,mobileNumber,0);
            } else {
                redisService.set(SMSKey.smsLimit,mobileNumber,0);
            }
            if(StringUtils.equals(type, SMSEnum.REGISTER.getCode())){
                redisService.set(SMSKey.smsKey,mobileNumber,String.valueOf(OTPNumber));
            } else if (StringUtils.equals(type,SMSEnum.RESET.getCode())) {
                redisService.set(SMSKey.resetPass,mobileNumber,String.valueOf(OTPNumber));
            } else if (StringUtils.equals(SMSEnum.FORGOT.getCode(),type)){
                redisService.set(SMSKey.forgotPass,mobileNumber,String.valueOf(OTPNumber));
            }
            return true;
        } else {
            log.error("send msg url:{}",url);
            log.error("send msg result:{}",result);
            throw new GlobalException(CodeMsg.SMS_CODE_SEND_ERROR);
        }
    }

    public Boolean verifyCode(String type, SMSValidateForm smsValidateForm) {
        String mobile = smsValidateForm.getMobile();
        String code = smsValidateForm.getCode();
        String redisCode = "";
        if(StringUtils.equals(type, SMSEnum.REGISTER.getCode())){
            redisCode = redisService.get(SMSKey.smsKey,mobile,String.class);
        } else if (StringUtils.equals(type,SMSEnum.RESET.getCode())) {
            redisCode = redisService.get(SMSKey.resetPass,mobile,String.class);
        } else if (StringUtils.equals(type,SMSEnum.FORGOT.getCode())){
            redisCode = redisService.get(SMSKey.forgotPass,mobile,String.class);
        }

        if(!StringUtils.isBlank(redisCode)){
            if(StringUtils.equals(code,redisCode)) {
                if(StringUtils.equals(type, SMSEnum.REGISTER.getCode())){
                    redisService.delete(SMSKey.smsKey,mobile);
                } else if (StringUtils.equals(type,SMSEnum.RESET.getCode())) {
                    redisService.delete(SMSKey.resetPass,mobile);
                } else if (StringUtils.equals(type,SMSEnum.FORGOT.getCode())){
                    redisService.delete(SMSKey.forgotPass,mobile);
                }
                return true;
            } else {
                throw  new GlobalException(CodeMsg.SMS_CODE_ERROR);
            }
        } else {
            throw  new GlobalException(CodeMsg.SMS_CODE_NOT_EXIST);
        }
    }
}
