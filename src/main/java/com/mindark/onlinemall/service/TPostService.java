package com.mindark.onlinemall.service;

import com.mindark.onlinemall.dao.TFollowDao;
import com.mindark.onlinemall.dao.TPostDao;
import com.mindark.onlinemall.domain.TCustomer;
import com.mindark.onlinemall.domain.TFollow;
import com.mindark.onlinemall.domain.TPost;
import com.mindark.onlinemall.form.TPostForm;
import jakarta.annotation.Resource;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class TPostService {

    @Resource
    TPostDao tPostDao;

    @Resource
    TFollowDao tFollowDao;

    public List<TPost> getExplorePosts() {
        return tPostDao.getExplorePosts();
    }

    public TPost getPostById(Integer id) {
        TPost tPost = new TPost();
        tPost.setPostId(id);
        return tPostDao.getPostById(tPost);
    }

    public void createPost(TPostForm tPostForm) {
        TPost tPost = new TPost();
        BeanUtils.copyProperties(tPostForm, tPost);
        tPostDao.createPost(tPost);
    }

    public void deletePostById(Integer postId, TCustomer tCustomer) {
        TPost tPost = new TPost();
        TPost setPostId = new TPost();
        setPostId.setPostId(postId);
        tPost = tPostDao.getPostById(setPostId);
        Integer authorId = tCustomer.getCustomerId();

        if (authorId == tPost.getCustomerId()) {
            tPost.setIsDelete(true);
            tPost.setUpdatedTime(new Date());
            tPostDao.deletePostById(tPost.getPostId());
        }
    }

    public List<TPost> searchDistinctPostsByTitleContentInventoryName(String searchCriteria){
        return tPostDao.searchDistinctPostsByTitleContentInventoryName(searchCriteria);
    }

    public List<TPost> getPostListFollowedByCustomerId(Integer customerId) {
        List<TFollow> getFollowingList = tFollowDao.getFollowingListByCustomerId(customerId);
        List<Integer> followingIds = getFollowingList.stream().map(TFollow::getFollowedId).collect(Collectors.toList());

        return tPostDao.getFollowingPostListByCustomerIds(followingIds);
    }
}
