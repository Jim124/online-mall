package com.mindark.onlinemall.controller;

import com.mindark.onlinemall.domain.TComment;
import com.mindark.onlinemall.domain.TCustomer;
import com.mindark.onlinemall.exception.GlobalException;
import com.mindark.onlinemall.form.TCommentForm;
import com.mindark.onlinemall.result.CodeMsg;
import com.mindark.onlinemall.result.Result;
import com.mindark.onlinemall.service.TCommentService;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/comments")
public class TCommentController {

    @Resource
    TCommentService tCommentService;

    @PostMapping("/create")
    public Result<Boolean> createComment(@Valid @RequestBody TCommentForm tCommentForm, TCustomer tCustomer) {
        if (tCustomer == null) {
            throw new GlobalException(CodeMsg.SIGN_IN);
        }
        tCommentForm.setCustomerId(tCustomer.getCustomerId());
        tCommentService.createComment(tCommentForm);
        return Result.success(true);

    }

    @GetMapping("/list/{postId}")
    public Result<List<TComment>> getCommentListByPostId(@PathVariable("postId") Integer postId) {
        List<TComment> commentList = tCommentService.getCommentByPostId(postId);
        return Result.success(commentList);
    }

    @GetMapping("/{commentId}")
    public Result<TComment> getCommentById(@PathVariable("commentId") Integer commentId) {
        TComment tCommentById = tCommentService.getCommentById(commentId);
        return Result.success(tCommentById);
    }

    @PatchMapping("/delete/{commentId}")
    public Result<Boolean> deleteCommentById(@PathVariable("commentId") Integer commentId, TCustomer tCustomer) {
        if (tCustomer == null) {
            throw new GlobalException(CodeMsg.SIGN_IN);
        }
        tCommentService.deleteCommentById(commentId, tCustomer);
        return Result.success(true);
    }
}
