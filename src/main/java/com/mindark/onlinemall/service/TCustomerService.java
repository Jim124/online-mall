package com.mindark.onlinemall.service;

import com.alibaba.druid.util.StringUtils;
import com.mindark.onlinemall.dao.TCustomerDao;
import com.mindark.onlinemall.domain.TCustomer;
import com.mindark.onlinemall.exception.GlobalException;
import com.mindark.onlinemall.form.TCustomerForm;
import com.mindark.onlinemall.redis.LoginKey;
import com.mindark.onlinemall.redis.RedisService;
import com.mindark.onlinemall.result.CodeMsg;
import com.mindark.onlinemall.vo.TCustomerVo;
import jakarta.annotation.Resource;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class TCustomerService {
    @Resource
    TCustomerDao tCustomerDao;


    public static final String COOK_NAME_TOKEN = "token";
    @Resource
    RedisService redisService;
    public TCustomer getByTel(String tel){
        return tCustomerDao.getByTel(tel);
    }

    public TCustomer getByToken(HttpServletResponse response, String token){
        if(StringUtils.isEmpty(token)) {
            return null;
        }
        TCustomer tCustomer = redisService.get(LoginKey.token,token,TCustomer.class);
        if(tCustomer != null) {
            addCookie(response,tCustomer,token);
        }

        return tCustomer;
    }


    public TCustomer save(TCustomerForm tCustomerForm) {
        TCustomer checkUser = getByTel(tCustomerForm.getPhoneNo());
        if(checkUser != null) {
            throw new GlobalException(CodeMsg.MOBILE_EXIST);
        }
        TCustomer tCustomer = new TCustomer();
        BeanUtils.copyProperties(tCustomerForm,tCustomer);

        tCustomerDao.insertCustomer(tCustomer);
        return tCustomer;
    }

    public boolean updatePassword(String token, String tel, String formPass) {
        //get user
        TCustomer user = getByTel(tel);
        if(user == null) {
            throw new GlobalException(CodeMsg.MOBILE_NOT_EXIST);
        }

        //update database
        TCustomer toBeUpdate = new TCustomer();
        toBeUpdate.setPhoneNo(tel);
        toBeUpdate.setPassword(formPass);
        tCustomerDao.updatePassword(toBeUpdate);

        //manage cache
        redisService.delete(LoginKey.token, token);
        user.setPassword(toBeUpdate.getPassword());
        redisService.set(LoginKey.token, token, user);
        return true;
    }

    public boolean updatePasswordByForgotType(String tel, String formPass) {
        //get user
        TCustomer user = getByTel(tel);
        if(user == null) {
            throw new GlobalException(CodeMsg.MOBILE_NOT_EXIST);
        }

        //update database
        TCustomer toBeUpdate = new TCustomer();
        toBeUpdate.setPhoneNo(tel);
        toBeUpdate.setPassword(formPass);
        toBeUpdate.setUpdatedTime(new Date());
        tCustomerDao.updatePassword(toBeUpdate);
        return true;
    }

    public boolean updateNickName(String token, String tel, String nickName) {
        //get user
        TCustomer user = getByTel(tel);
        if(user == null) {
            throw new GlobalException(CodeMsg.MOBILE_NOT_EXIST);
        }
        //update database
        TCustomer toBeUpdate = new TCustomer();
        toBeUpdate.setPhoneNo(tel);
        toBeUpdate.setUsername(nickName);
        tCustomerDao.updateNickName(toBeUpdate);

        //manage cache
        redisService.delete(LoginKey.token, tel);
        user.setUsername(toBeUpdate.getUsername());
        redisService.set(LoginKey.token, token, user);
        return true;
    }

    public Boolean updateAvatar(String token, String tel, String head) {
        TCustomer user = getByTel(tel);
        if(user == null) {
            throw new GlobalException(CodeMsg.MOBILE_NOT_EXIST);
        }
        //update database
        TCustomer toBeUpdate = new TCustomer();
       toBeUpdate.setPhoneNo(tel);
        toBeUpdate.setProfileImg(head);
        tCustomerDao.updateAvatar(toBeUpdate);

        //manage cache
        redisService.delete(LoginKey.token, token);
        user.setProfileImg(toBeUpdate.getProfileImg());
        redisService.set(LoginKey.token, token, user);
        return true;
    }
    private void addCookie(HttpServletResponse response,TCustomer tCustomer,String token){
        //String token = UUIDUtil.uuid();
        redisService.set(LoginKey.token,token,tCustomer);
        Cookie cookie = new Cookie(COOK_NAME_TOKEN,token);
        cookie.setMaxAge(LoginKey.token.expireSeconds());
        cookie.setPath("/");
        response.addCookie(cookie);
    }

    public TCustomerVo getById(Integer id) {
        TCustomer tCustomer = new TCustomer();
        tCustomer.setCustomerId(id);
        return tCustomerDao.selectTCustomerById(tCustomer);
    }


    public TCustomerVo addFollowing(Integer customerId) {
        tCustomerDao.addCustomerFollowingNum(customerId);
        TCustomer tCustomer = new TCustomer();
        tCustomer.setCustomerId(customerId);
        return tCustomerDao.selectTCustomerById(tCustomer);
    }

    public TCustomerVo minusFollowing(Integer customerId) {
        TCustomer tCustomer = new TCustomer();
        tCustomer.setCustomerId(customerId);
        TCustomerVo tCustomerVo = tCustomerDao.selectTCustomerById(tCustomer);
        if(tCustomerVo.getFollowingNum() > 0) {
            tCustomerDao.minusCustomerFollowingNum(customerId);
        }
        return tCustomerDao.selectTCustomerById(tCustomer);
    }

    public TCustomerVo addFollower(Integer customerId) {
        tCustomerDao.addCustomerFollowerNum(customerId);
        TCustomer tCustomer = new TCustomer();
        tCustomer.setCustomerId(customerId);
        return tCustomerDao.selectTCustomerById(tCustomer);
    }

    public TCustomerVo minusFollower(Integer customerId) {
        TCustomer tCustomer = new TCustomer();
        tCustomer.setCustomerId(customerId);
        TCustomerVo tCustomerVo = tCustomerDao.selectTCustomerById(tCustomer);
        if(tCustomerVo.getFollowerNum() > 0) {
            tCustomerDao.minusCustomerFollowerNum(customerId);
        }
        return tCustomerDao.selectTCustomerById(tCustomer);
    }
}
