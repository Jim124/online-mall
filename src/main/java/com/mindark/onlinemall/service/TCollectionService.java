package com.mindark.onlinemall.service;

import com.mindark.onlinemall.dao.TCollectionDao;
import com.mindark.onlinemall.dao.TPostDao;
import com.mindark.onlinemall.domain.TCollection;
import com.mindark.onlinemall.domain.TCustomer;
import com.mindark.onlinemall.domain.TPost;
import com.mindark.onlinemall.form.TCollectionForm;
import jakarta.annotation.Resource;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

@Service
public class TCollectionService {

    @Resource
    TCollectionDao tCollectionDao;

    @Resource
    TPostDao tPostDao;

    public void createCollection(TCollectionForm tCollectionForm, TCustomer tCustomer) {
        TCollection tCollection = new TCollection();
        BeanUtils.copyProperties(tCollectionForm, tCollection);
        Integer customerId = tCollection.getCustomerId();

        if (tCollection.getPostId() != null) {
            Integer postId = tCollection.getPostId();
            TPost tPostGetId = new TPost();
            tPostGetId.setPostId(postId);
            TPost tPost = tPostDao.getPostById(tPostGetId);
            Integer collectNum = tPost.getCollectionNum();

            if (isCustomerCollectedPost(postId, customerId) == false) {
                collectNum += 1;
                tPostDao.updateCollectionNumById(postId, collectNum);
                tCollectionDao.createCollection(tCollection);
            } else {
                TCollection tCollectionDetails = tCollectionDao.getCollectionDetailsByPostIdCustomerId(postId, customerId);
                Integer collectionId = tCollectionDetails.getCollectionId();
                Boolean collectionStatus = tCollectionDetails.getStatus();

                if (collectionStatus == true) {
                    collectNum -= 1;
                    tPostDao.updateCollectionNumById(postId, collectNum);
                } else {
                    collectNum += 1;
                    tPostDao.updateCollectionNumById(postId, collectNum);
                }

                tCollectionDao.updateCollectionStatusById(collectionId, !collectionStatus);
            }
        }
    }

    public boolean isCustomerCollectedPost(Integer postId, Integer customerId) {
        return tCollectionDao.collectionExistByPostIdCustomerId(postId, customerId);
    }
}
