package com.mindark.onlinemall.dao;

import com.mindark.onlinemall.domain.TCustomer;
import com.mindark.onlinemall.vo.TCustomerVo;
import org.apache.ibatis.annotations.*;

@Mapper
public interface TCustomerDao {

    @Insert("insert into t_customer (username, password, profile_img, phone_no) values(#{username},hex(aes_encrypt(#{password}, left('1a2s3dg', 7))),#{profileImg},#{phoneNo})")
    void insertCustomer(TCustomer tCustomer);
    @Select("select * from t_customer where phone_no=#{phoneNo}")
    TCustomer getByTel(@Param("phoneNo") String phoneNo);
    @Update("update t_customer set password=hex(aes_encrypt(#{password}, left('1a2s3dg', 7))),updated_time=#{updatedTime} where phone_no=#{phone}")
    void updatePassword(TCustomer toBeUpdate);
    @Update("update t_customer set username=#{username},updated_time=#{updatedTime} where phone_no=#{phone}")
    void updateNickName(TCustomer toBeUpdate);
    @Update("update t_customer set profile_img=#{profileImg},updated_time=#{updatedTime} where phone_no=#{phone}")
    void updateAvatar(TCustomer toBeUpdate);

    @Select("select hex(aes_encrypt(#{password}, left('1a2s3dg', 7)))")
    String getEncrypt(@Param("password")String password);

    @Update("update t_customer set following_num=following_num +1 where customer_id=#{customerId}")
    void addCustomerFollowingNum(@Param("customerId")Integer customerId);
    @Update("update t_customer set follower_num=follower_num +1 where customer_id=#{customerId}")
    void addCustomerFollowerNum(@Param("customerId")Integer customerId);
    @Update("update t_customer set following_num= following_num -1 where customer_id=#{customerId}")
    void minusCustomerFollowingNum(@Param("customerId")Integer customerId);

    @Update("update t_customer set follower_num= follower_num -1 where customer_id=#{customerId}")
    void minusCustomerFollowerNum(@Param("customerId")Integer customerId);

    TCustomerVo selectTCustomerById(TCustomer tCustomer);
}
