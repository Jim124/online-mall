package com.mindark.onlinemall.service;

import com.mindark.onlinemall.dao.TCommentDao;
import com.mindark.onlinemall.dao.TPostDao;
import com.mindark.onlinemall.domain.TComment;
import com.mindark.onlinemall.domain.TCustomer;
import com.mindark.onlinemall.domain.TPost;
import com.mindark.onlinemall.form.TCommentForm;
import jakarta.annotation.Resource;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class TCommentService {

    @Resource
    TCommentDao tCommentDao;

    @Resource
    TPostDao tPostDao;

    public void createComment(TCommentForm tCommentForm) {
        TComment tComment = new TComment();
        BeanUtils.copyProperties(tCommentForm, tComment);
        if (tComment.getContent() != null) {
            Integer postId = tComment.getPostId();
            TPost setPostId = new TPost();
            setPostId.setPostId(postId);
            TPost tPost = tPostDao.getPostById(setPostId);
            Integer postAuthorId = tPost.getCustomerId();
            Integer commentAuthorId = tComment.getCustomerId();
            Integer commentNum = tPost.getCommentNum();

            if (postAuthorId.equals(commentAuthorId)) {
                tComment.setIsAuthor(true);
                tCommentDao.createComment(tComment);
            } else {
                tComment.setIsAuthor(false);
                tCommentDao.createComment(tComment);
            }
            commentNum += 1;
            tPostDao.updateCommentNumById(postId, commentNum);
        }
    }

    public TComment getCommentById(Integer id) {
        TComment tComment = new TComment();
        tComment.setCommentId(id);
        return tCommentDao.getCommentById(tComment);
    }

    public List<TComment> getCommentByPostId(Integer postId) {
        return tCommentDao.getCommentByPostId(postId);
    }

    public List<TComment> getCommentList() {
        return tCommentDao.getCommentList();
    }

    public void deleteCommentById(Integer commentId, TCustomer tCustomer) {
        TComment tComment = new TComment();
        TComment setcommentId = new TComment();
        setcommentId.setCommentId(commentId);
        tComment = tCommentDao.getCommentById(setcommentId);
        Integer authorId = tComment.getCustomerId();

        if (authorId == tComment.getCustomerId()) {
            tComment.setIsDelete(true);
            tComment.setUpdatedTime(new Date());
            tCommentDao.deleteCommentById(tComment.getCommentId());
        }

    }
}
