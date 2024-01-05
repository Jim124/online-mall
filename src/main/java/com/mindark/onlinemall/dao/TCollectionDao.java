package com.mindark.onlinemall.dao;

import com.mindark.onlinemall.domain.TCollection;
import org.apache.ibatis.annotations.*;

@Mapper
public interface TCollectionDao {

    @Insert("insert into t_collection(post_id, customer_id) " +
            "values (#{postId}, #{customerId})")
    void createCollection(TCollection tCollection);

    @Update("update t_collection set status = #{status} where collection_id = #{collectionId}")
    void updateCollectionStatusById(@Param("collectionId") Integer collectionId, @Param("status") Boolean status);

    @Select("select * from t_collection where post_id=#{postId} and customer_id=#{customerId}")
    TCollection getCollectionDetailsByPostIdCustomerId(@Param("postId")Integer postId, @Param("customerId")Integer customerId);

    @Select("SELECT EXISTS(SELECT 1 FROM t_collection WHERE post_id=#{postId} AND customer_id=#{customerId})")
    boolean collectionExistByPostIdCustomerId(@Param("postId")Integer postId, @Param("customerId")Integer customerId);
}
