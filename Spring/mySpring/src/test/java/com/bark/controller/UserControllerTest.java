package com.bark.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class UserControllerTest {
	@Setter(onMethod_=@Autowired)
	private WebApplicationContext ctx;
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testUserList() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/user/user-list")).andReturn().getModelAndView().getModelMap());
	}
	@Test
	public void testAdminList() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/user/admin-list")).andReturn().getModelAndView().getModelMap());
	}
	@Test
	public void testJoin() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/user/join").param("id", "testing").param("pwd", "1234"))
				.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	@Test
	public void testUserDetail() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.get("/user/user-detail").param("id", "testing"))
				.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
	@Test
	public void testModify() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/user/modify").param("id", "testing").param("pwd", "1234").param("email", "modifiedEmail@bark.com"))
				.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
	@Test
	public void testDelete() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/user/delete").param("id", "testing")).andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
}
