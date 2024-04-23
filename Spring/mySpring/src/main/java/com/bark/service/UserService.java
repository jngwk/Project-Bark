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
	public int checkEmail(String email) {
		log.info("findAcc..................");
		return mapper.checkEmail(email);
	}
	public String getUserId(String email) {
		return mapper.getUserId(email);
	}
	public int updateUserPwd(String email, String pwd) {
		return mapper.updateUserPwd(email, pwd);
	}
	public List<User> getUserType(String filter,String input, int type) {
		return mapper.getUserType(filter, input,type);
	}

	public List<User> getSearchUser(String filter,String input) {
		return mapper.getSearchUser(filter,input);
	}
	//관리자페이지 보호소승인
	public boolean availableUpdate(String available,String id) {
		return mapper.availableUpdate(available,id)==1;
	}

	public int updateUser(User user) {
		return mapper.update(user);
	}
	
	// 입양상세 -> 입양 신청시 회원 주소 update
	public int updateAddr(String id, String address) {
		return mapper.updateAddr(id, address);
	}
	
	public int updateShelterno(String id, Integer shelterno) {
		return mapper.updateShelterno(id, shelterno);
	}
	//보호소페이지 입양승인
	public boolean adoptionState(String state, String id) {
		return mapper.adoptionState(state,id)==1;
	}
}
