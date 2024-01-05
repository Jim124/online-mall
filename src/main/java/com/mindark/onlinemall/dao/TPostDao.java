package com.mindark.onlinemall.dao;

import com.mindark.onlinemall.domain.TPost;
import com.mindark.onlinemall.vo.TPostVo;
import org.apache.ibatis.annotations.*;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

@Mapper
public interface TPostDao {


    List<TPost> getExplorePosts();

    TPost getPostById(TPost tPost);

    @Insert("insert into t_post(customer_id, title, content," + " inventory_url, inventory_id, inventory_img," + " inventory_name, img_url) VALUES (#{customerId}, " + "#{title}, #{content}, #{inventoryUrl}, #{inventoryId}," + " #{inventoryName}, #{inventoryImg}, #{imgUrl})")
    void createPost(TPost tPost);

    @Update("update t_post set is_delete = true where post_id=#{postId}")
    void deletePostById(@Param("postId") Integer postId);

    @Update("update t_post set like_num = #{likeNum} where post_id=#{postId}")
    void updateLikeNumById(@Param("postId") Integer postId, @Param("likeNum") Integer likeNum);

    @Update("update t_post set collection_num = #{collectionNum} where post_id=#{postId}")
    void updateCollectionNumById(@Param("postId") Integer postId, @Param("collectionNum") Integer collectionNum);

    @Update("update t_post set comment_num = #{commentNum} where post_id=#{postId}")
    void updateCommentNumById(@Param("postId") Integer postId, @Param("commentNum") Integer commentNum);

    List<TPost> searchDistinctPostsByTitleContentInventoryName(@Param("searchCriteria") String searchCriteria);

    List<TPost> getFollowingPostListByCustomerIds(List<Integer> customerIds);
}
