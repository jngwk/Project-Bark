package com.bark.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdoptionMapperTest {
	@Setter(onMethod_ = {@Autowired})
	private AdoptionMapper mapper;
	
	@Test
	public void testGetDogList() {
		log.info(mapper.getDogList());
	}
	
	@Test
	public void testGetDog() {
		log.info(mapper.getDog(1));
	}
	
	
}
