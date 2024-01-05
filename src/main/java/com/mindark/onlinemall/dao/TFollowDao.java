package com.mindark.onlinemall.dao;
import com.mindark.onlinemall.domain.TFollow;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface TFollowDao {

    @Insert("insert into t_follow(followee_id, followed_id) values (#{followeeId}, #{followedId})")
    void createFollow(TFollow tFollow);

    @Update("update t_follow set status = #{status} where follow_id = #{followId}")
    void updateFollowStatusById(@Param("followId")Integer followId, @Param("status")Boolean status);

    @Select("SELECT EXISTS(SELECT 1 FROM t_follow WHERE followee_id=#{followeeId} AND followed_id=#{followedId})")
    boolean followExistByFolloweeIdFollowedId(@Param("followeeId")Integer followeeId, @Param("followedId")Integer followedId);

    @Select("select * from t_follow where followee_id=#{followeeId} and followed_id=#{followedId}")
    TFollow getFollowDetailsByFolloweeIdFollowedId(@Param("followeeId")Integer followeeId, @Param("followedId")Integer followedId);

    //查找关注中列表
    @Select("select * from t_follow where followee_id=#{followeeId} ORDER BY updated_time DESC")
    List<TFollow> getFollowingListByCustomerId(@Param("followeeId")Integer followeeId);

    //查找关注者列表
    @Select("select * from t_follow where followed_id=#{followedId} ORDER BY updated_time DESC")
    List<TFollow> getFollowerListByCustomerId(@Param("followedId")Integer followedId);
}
