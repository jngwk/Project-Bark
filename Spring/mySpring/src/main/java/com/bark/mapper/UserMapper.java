package com.bark.mapper;

import java.util.List;

import com.bark.domain.User;

public interface UserMapper {
//	@Select("select * from user")
	public List<User> getUserList();
	public List<User> getAdminList();
	public User getUser(String id);
	public int insert(User user);
	public int update(User user);
	public int delete(User user);
}
