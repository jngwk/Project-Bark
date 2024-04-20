package com.bark.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bark.domain.User;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTest {
	@Setter(onMethod_ = {@Autowired})
	private UserMapper mapper;
	
	@Test
	public void testGetUserList() {
		mapper.getUserList().forEach(user -> log.info(user));
	}
	
	/*
	 * @Test public void testGetAdminList() { mapper.getAdminList().forEach(user ->
	 * log.info(user)); }
	 */
	
	@Test
	public void testGetUser() {
		User user = mapper.getUser("gildong");
		log.info(user);
	}
	
	@Test
	public void testInsert() {
		User user = new User();
		user.setId("testing");
		int result = mapper.insert(user);
		log.info(user);
		log.info("result: " + result); // returns 1 on success
	}
	
	@Test
	public void testUpdate() {
		User user = mapper.getUser("gildong");
		user.setEmail("changedEmail@bark.com");
		int result = mapper.update(user);
		log.info(user);
		log.info("result: " + result);
	}
	
	@Test
	public void testDelete() {
		User user = mapper.getUser("testing");
		int result = mapper.delete(user);
		log.info(user);
		log.info("result: " + result);
	}
}
