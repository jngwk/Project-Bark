package com.bark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bark.domain.User;
import com.bark.mapper.UserMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserService {
	@Setter(onMethod_=@Autowired)
	private UserMapper mapper;
	
	public List<User> getUserList(){
		log.info("getUserList..................");
		return mapper.getUserList();
	}
	public List<User> getAdminList(){
		log.info("getAdminList..................");
		return mapper.getAdminList();
	}
	public User getUser(String id) {
		log.info("getUser..................");
		return mapper.getUser(id);
	}
	public boolean join(User user) {
		log.info("insert..................");
		return mapper.insert(user)==1;
	}
	public boolean modify(User user) {
		log.info("update..................");
		return mapper.update(user)==1;
	}
	public boolean delete(User user) {
		log.info("delete..................");
		return mapper.delete(user)==1;
	}
}