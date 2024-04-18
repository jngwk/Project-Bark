package com.bark.service;

import static org.junit.Assert.assertNotNull;

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
public class UserServiceTest {
	@Setter(onMethod_=@Autowired)
	private UserService service;
	
	@Test
	public void testExist() {
		assertNotNull(service);
		log.info(service);
	}
	
	@Test
	public void testGetUserList() {
		service.getUserList().forEach(user -> log.info(user));
	}
	
	@Test
	public void testGetAdminList() {
		service.getAdminList().forEach(user -> log.info(user));
	}
	
	@Test
	public void testGetUser() {
		User user = service.getUser("test");
		log.info(user);
	}
	
	@Test
	public void testJoin() {
		User user = new User();
		user.setId("test");
		boolean joined = service.join(user);
		log.info(user);		
		log.info("Joined: " + joined);
	}
	
	@Test
	public void testModify() {
		User user = service.getUser("testing");
		user.setEmail("testing@bark.com");
		boolean modified = service.modify(user);
		log.info(user);
		log.info("Modified: " + modified);
	}
	
	@Test
	public void testDelete() {
		User user = service.getUser("testing");
		boolean deleted = service.delete(user);
		log.info(user);
		log.info("Deleted: " + deleted);
	}
	
	@Test
	public void testCheckId() {
		String id = "gildong";
		int count = service.checkId(id);
		log.info("count = " + count);
	}
}
