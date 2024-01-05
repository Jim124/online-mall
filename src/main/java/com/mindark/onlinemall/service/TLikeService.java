package com.mindark.onlinemall.service;

import com.mindark.onlinemall.dao.TCommentDao;
import com.mindark.onlinemall.dao.TLikeDao;
import com.mindark.onlinemall.dao.TPostDao;
import com.mindark.onlinemall.domain.TComment;
import com.mindark.onlinemall.domain.TCustomer;
import com.mindark.onlinemall.domain.TLike;
import com.mindark.onlinemall.domain.TPost;
import com.mindark.onlinemall.form.TLikeForm;
import jakarta.annotation.Resource;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

@Service
public class TLikeService {

    @Resource
    TLikeDao tLikeDao;

    @Resource
    TPostDao tPostDao;

    @Resource
    TCommentDao tCommentDao;

    public void createLike(TLikeForm tLikeForm, TCustomer tCustomer) {
        TLike tLike = new TLike();
        BeanUtils.copyProperties(tLikeForm, tLike);
        Integer customerId = tCustomer.getCustomerId();

        if (tLike.getPostId() != null) {
            tLike.setType(1);
            Integer postId = tLike.getPostId();
            TPost tPostGetId = new TPost();
            tPostGetId.setPostId(postId);
            TPost tPost = tPostDao.getPostById(tPostGetId);
            Integer likeNum = tPost.getLikeNum();

            if (isCustomerLikedPost(postId, customerId) == false) {
                likeNum += 1;
                tPostDao.updateLikeNumById(postId, likeNum);
                tLikeDao.createLike(tLike);
            } else {
                TLike tLikeDetails = tLikeDao.getLikeDetailsByPostIdCustomerId(postId, customerId);
                Integer likeId = tLikeDetails.getLikeId();
                Boolean likeStatus = tLikeDetails.getStatus();

                if (likeStatus == true) {
                    likeNum -= 1;
                    tPostDao.updateLikeNumById(postId, likeNum);
                } else {
                    likeNum += 1;
                    tPostDao.updateLikeNumById(postId, likeNum);
                }
                tLikeDao.updateLikeStatusById(likeId, !likeStatus);
            }

        } else if (tLike.getCommentId() != null) {
            tLike.setType(2);
            Integer commentId = tLike.getCommentId();
            TComment tCommentGetId = new TComment();
            tCommentGetId.setCommentId(commentId);
            TComment tComment = tCommentDao.getCommentById(tCommentGetId);
            Integer likeNum = tComment.getLikeNum();

            if (isCustomerLikedComment(commentId, customerId) == false) {

                likeNum += 1;
                tCommentDao.updateLikeNumById(commentId, likeNum);
                tLikeDao.createLike(tLike);
            } else {
                TLike tLikeDetails = tLikeDao.getLikeDetailsByCommentIdCustomerId(commentId, customerId);
                Integer likeId = tLikeDetails.getLikeId();
                Boolean likeStatus = tLikeDetails.getStatus();

                if (likeStatus == true) {
                    likeNum -= 1;
                    tCommentDao.updateLikeNumById(commentId, likeNum);
                } else {
                    likeNum += 1;
                    tCommentDao.updateLikeNumById(commentId, likeNum);
                }
                tLikeDao.updateLikeStatusById(likeId, !likeStatus);
            }
        }
    }

    public boolean isCustomerLikedPost(Integer postId, Integer customerId) {
        return tLikeDao.likeExistByPostIdCustomerId(postId, customerId);
    }

    public boolean isCustomerLikedComment(Integer commentId, Integer customerId) {
        return tLikeDao.likeExistByCommentIdCustomerId(commentId, customerId);
    }
}
