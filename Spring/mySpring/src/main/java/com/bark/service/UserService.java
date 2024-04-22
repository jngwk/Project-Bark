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

	/*
	 * public List<User> getAdminList(){ log.info("getAdminList..................");
	 * return mapper.getAdminList(); }
	 */
	public User getUser(String id) {
		log.info("getUser..................");
		return mapper.getUser(id);
	}
	public boolean join(User user) {
		user.setAddr(user.getAddr() + user.getAddrDetail());
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
	public int checkId(String id) {
		log.info("checkId..................");
		return mapper.checkId(id);
	}
	public int findAcc(String name, String email) {
		log.info("findAcc..................");
		return mapper.findAcc(name, email);
	}
	public List<User> getUserType(String filter,String input,int type) {
		return mapper.getUserType(filter,input,type);
	}

	public List<User> getSearchUser(String filter,String input) {
		return mapper.getSearchUser(filter,input);
	}

	public boolean availableUpdate(String available,String id) {
		return mapper.availableUpdate(available,id)==1;
	}
}
