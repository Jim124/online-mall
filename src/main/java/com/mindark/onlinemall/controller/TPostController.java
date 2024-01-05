package com.mindark.onlinemall.controller;

import com.mindark.onlinemall.domain.TCustomer;
import com.mindark.onlinemall.domain.TPost;
import com.mindark.onlinemall.exception.GlobalException;
import com.mindark.onlinemall.form.TPostForm;
import com.mindark.onlinemall.result.CodeMsg;
import com.mindark.onlinemall.result.Result;
import com.mindark.onlinemall.service.TPostService;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/posts")
@Slf4j
public class TPostController {

    @Resource
    public TPostService tPostService;

    @GetMapping("/explores")
    public Result<List<TPost>> getExplorePosts() {
        List<TPost> explorePostsList = tPostService.getExplorePosts();
        return Result.success(explorePostsList);
    }

    @GetMapping("/explores/{postId}")
    public Result<TPost> getPostById(@PathVariable("postId") Integer postId) {
        TPost tPostById = tPostService.getPostById(postId);
        return Result.success(tPostById);
    }

    @GetMapping("/following")
    public Result<List<TPost>> followingPostList(TCustomer tCustomer) {
        if (tCustomer == null) {
            throw new GlobalException(CodeMsg.SIGN_IN);
        }
        List<TPost> followingPostList = tPostService.getPostListFollowedByCustomerId(tCustomer.getCustomerId());
        return Result.success(followingPostList);
    }

    @PostMapping("/create")
    public Result<Boolean> createPost(@Valid @RequestBody TPostForm tPostForm, TCustomer tCustomer) {
        if (tCustomer == null) {
            throw new GlobalException(CodeMsg.SIGN_IN);
        }
        tPostForm.setCustomerId(tCustomer.getCustomerId());
        tPostService.createPost(tPostForm);
        return Result.success(true);
    }

    @PatchMapping("/delete/{postId}")
    public Result<Boolean> deletePostById(@PathVariable("postId") Integer postId, TCustomer tCustomer) {
        if (tCustomer == null) {
            throw new GlobalException(CodeMsg.SIGN_IN);
        }
        tPostService.deletePostById(postId, tCustomer);
        return Result.success(true);
    }

    @PostMapping("/search")
    public Result<List<TPost>> getSearchResult(@Valid @RequestBody TPostForm tPostForm){
        String searchCriteria = tPostForm.getSearchCriteria();
        List<TPost> searchResult= tPostService.searchDistinctPostsByTitleContentInventoryName(searchCriteria);
        return Result.success(searchResult);
    }
}
