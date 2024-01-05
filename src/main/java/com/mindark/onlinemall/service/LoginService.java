package com.mindark.onlinemall.service;

import com.alibaba.druid.util.StringUtils;

import com.mindark.onlinemall.dao.TCustomerDao;
import com.mindark.onlinemall.domain.TCustomer;
import com.mindark.onlinemall.exception.GlobalException;
import com.mindark.onlinemall.form.LoginForm;
import com.mindark.onlinemall.redis.LoginKey;
import com.mindark.onlinemall.redis.RedisService;
import com.mindark.onlinemall.result.CodeMsg;
import com.mindark.onlinemall.util.UUIDUtil;
import jakarta.annotation.Resource;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class LoginService {

    public static final String COOK_NAME_TOKEN = "token";

    @Resource
    TCustomerDao tCustomerDao;
    @Resource
    RedisService redisService;


    public Map<String,String> login(HttpServletResponse response, LoginForm loginForm) {
        Map<String,String> map = new HashMap<>();
        if(loginForm == null) {
            throw new GlobalException(CodeMsg.SERVER_ERROR);
        }
        TCustomer tCustomer = tCustomerDao.getByTel(loginForm.getPhoneNo());
        //validate the mobile is exit;
        if(tCustomer == null) {
            throw new GlobalException(CodeMsg.MOBILE_NOT_EXIST);
        }

        //validate the password is correct;
        String encryptPassword = tCustomerDao.getEncrypt(loginForm.getPassword());
        String dbPass = tCustomer.getPassword();

        if(!StringUtils.equals(dbPass,encryptPassword)){
            throw new GlobalException(CodeMsg.PASSWORD_ERROR);
        }

        //generate token
        String token = UUIDUtil.uuid();
        redisService.set(LoginKey.token,token,tCustomer);
        Cookie cookie = new Cookie(COOK_NAME_TOKEN,token);
        cookie.setMaxAge(LoginKey.token.expireSeconds());
        cookie.setPath("/");
        response.addCookie(cookie);
        map.put("token",token);
        map.put("username",tCustomer.getUsername());
        map.put("profileImg",tCustomer.getProfileImg());
        map.put("phoneNo",tCustomer.getPhoneNo());
        return map;
    }

}
