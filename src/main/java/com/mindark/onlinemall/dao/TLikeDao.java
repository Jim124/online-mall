package com.mindark.onlinemall.dao;

import com.mindark.onlinemall.domain.TLike;
import org.apache.ibatis.annotations.*;

@Mapper
public interface TLikeDao {
    @Insert("insert into t_like(customer_id, post_id, comment_id, type)" +
            " values (#{customerId}, #{postId}, #{commentId}, #{type})")
    void createLike(TLike tLike);

    @Select("select * from t_like where post_id=#{postId} and customer_id=#{customerId}")
    TLike getLikeDetailsByPostIdCustomerId(@Param("postId") Integer postId, @Param("customerId") Integer customerId);

    @Select("SELECT EXISTS(SELECT 1 FROM t_like WHERE post_id=#{postId} AND customer_id=#{customerId})")
    boolean likeExistByPostIdCustomerId(@Param("postId") Integer postId, @Param("customerId") Integer customerId);

    @Select("select * from t_like where comment_id=#{commentId} and customer_id=#{customerId}")
    TLike getLikeDetailsByCommentIdCustomerId(@Param("commentId") Integer commentId, @Param("customerId") Integer customerId);

    @Select("SELECT EXISTS(SELECT 1 FROM t_like WHERE comment_id=#{commentId} AND customer_id=#{customerId})")
    boolean likeExistByCommentIdCustomerId(@Param("commentId") Integer commentId, @Param("customerId") Integer customerId);

    @Update("update t_like set status = #{status} where like_id = #{likeId}")
    void updateLikeStatusById(@Param("likeId") Integer likeId, @Param("status") Boolean status);
}
