package com.mindark.onlinemall.dao;

import com.mindark.onlinemall.domain.TComment;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface TCommentDao {

    @Insert("INSERT INTO t_comment (post_id, customer_id, content, parent_id, is_author) " +
            "VALUES (#{postId}, #{customerId}, #{content}, #{parentId}, #{isAuthor})")
    void createComment(TComment tComment);

    @Select("select * from t_comment where is_delete=false")
    List<TComment> getCommentList();

    @Select("select * from t_comment where comment_id=#{commentId}")
    TComment getCommentById(TComment tComment);

    @Select("select * from t_comment where post_id=#{postId} ORDER BY updated_time DESC")
    List<TComment> getCommentByPostId(Integer postId);

    @Update("update t_comment set is_delete = true where comment_id=#{commentId}")
    void deleteCommentById(@Param("commentId")Integer commentId);

    @Update("update t_comment set like_num = #{likeNum} where comment_id = #{commentId}")
    void updateLikeNumById(@Param("commentId")Integer commentId, @Param("likeNum")Integer likeNum);
}
