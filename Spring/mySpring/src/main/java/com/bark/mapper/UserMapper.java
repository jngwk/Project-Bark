package com.bark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bark.domain.User;

public interface UserMapper {
	@Select("select * from user where type != 3")
	public List<User> getUserList();
	@Select("select * from user where type = 3")
	/*
	 * public List<User> getAdminList();
	 * 
	 * @Select("select * from user where id = #{id}")
	 */
	public User getUser(String id);
	@Insert("insert into user(id, pwd, name, phone, email, addr, addrDetail, postcode, bank, bankAcc, type)\r\n"
			+ "	values(#{id}, #{pwd}, #{name}, #{phone}, #{email}, #{addr}, #{available}, #{type})")
	public int insert(User user);
	@Update("update user \r\n"
			+ "	set pwd = #{pwd}, phone = #{phone}, email = #{email}, addr = #{addr}\r\n"
			+ "	where id = #{id}")
	public int update(User user);
	@Delete("delete from user where id=#{id}")
	public int delete(User user);
    @Select("select User from user where email = #{email}")
    public User findUser(String email);
    @Select("select count(id) from user where id = #{id}")
	public int checkId(String id);
    @Select("select count(id) from user where email = #{email}")
	public int checkEmail(String email);
    @Select("select id from user where email = #{email}")
	public String getUserId(String email);
    @Update("update user set pwd = #{pwd} where email = #{email}")
	public int updateUserPwd(@Param("email") String email, @Param("pwd")String pwd);
	
}