package com.mindark.onlinemall.service;

import com.mindark.onlinemall.dao.TCustomerDao;
import com.mindark.onlinemall.dao.TFollowDao;
import com.mindark.onlinemall.domain.TCustomer;
import com.mindark.onlinemall.domain.TFollow;
import com.mindark.onlinemall.form.TFollowForm;
import jakarta.annotation.Resource;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TFollowService {

    @Resource
    TFollowDao tFollowDao;

    @Resource
    TCustomerDao tCustomerDao;

    public List<TFollow> getFollowingListByCustomerId(Integer followeeId){
        return tFollowDao.getFollowingListByCustomerId(followeeId);
    }

    public List<TFollow> getFollowerListByCustomerId(Integer followedId) {
        return tFollowDao.getFollowerListByCustomerId(followedId);
    }

    public void createFollow(TFollowForm tFollowForm) {
        TFollow tFollow = new TFollow();
        BeanUtils.copyProperties(tFollowForm, tFollow);
        Integer followeeId = tFollowForm.getFolloweeId();
        Integer followedId = tFollowForm.getFollowedId();

        if (checkIfFollowed(followeeId, followedId)) {
            TFollow tFollowDetails = tFollowDao.getFollowDetailsByFolloweeIdFollowedId(followeeId, followedId);
            Integer followId = tFollowDetails.getFollowId();
            Boolean followStatus = tFollowDetails.getStatus();

            if (followStatus) {
                tFollowDao.updateFollowStatusById(followId, !followStatus);
                tCustomerDao.minusCustomerFollowerNum(followedId);
                tCustomerDao.minusCustomerFollowingNum(followeeId);
            } else {
                tFollowDao.updateFollowStatusById(followId, !followStatus);
                tCustomerDao.addCustomerFollowerNum(followedId);
                tCustomerDao.addCustomerFollowingNum(followeeId);
            }

        } else {
            tFollowDao.createFollow(tFollow);
            tCustomerDao.addCustomerFollowerNum(followedId);
            tCustomerDao.addCustomerFollowingNum(followeeId);
        }
    }

    public Boolean checkIfFollowed(Integer followeeId, Integer followedId) {
        return tFollowDao.followExistByFolloweeIdFollowedId(followeeId, followedId);
    }
}
