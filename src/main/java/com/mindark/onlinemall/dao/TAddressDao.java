package com.mindark.onlinemall.dao;

import com.mindark.onlinemall.domain.TAddress;
import com.mindark.onlinemall.vo.TAddressVo;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface TAddressDao {
    @Insert("insert into t_address(customer_id, state_id, name, phone_no, address, zip_code, " +
            "city_name, is_default) values (#{customerId}," +
            "#{stateId},#{name},#{phoneNo},#{address},#{zipCode},#{cityName},#{isDefault})")
    void insertData(TAddress tAddress);

    @Update("update t_address set is_default=false where customer_id=#{customerId}")
    void updatedCustomerAddressByCustomerId(@Param("customerId")Integer customerId);

    @Select("select a.address_id,a.customer_id,t.state_name,a.name,a.phone_no,a.zip_code,a.address," +
            "a.city_name,a.is_default from t_address a left join t_state t on a.state_id = t.state_id where a.customer_id=#{customerId}")
    List<TAddressVo> getCustomerAddressesByCustomerId(@Param("customerId")Integer customerId);

    @Delete("delete from t_address where address_id=#{addressId}")
    void deleteAddressByAddressId(@Param("addressId")Integer addressId);

    void updateAddressByAddressId(TAddress tAddress);

    @Select("select a.address_id,a.customer_id,t.state_name,a.name,a.phone_no,a.zip_code,a.address," +
            "a.city_name,a.is_default from t_address a left join t_state t on a.state_id = t.state_id where a.address_id=#{addressId}")
    TAddressVo getAddressDetail(@Param("addressId")Integer addressId);
}
