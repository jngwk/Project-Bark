package com.bark.mapper;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bark.domain.Board;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTest {
	@Setter(onMethod_ = {@Autowired})
	private BoardMapper mapper;
//
//	@Test
//	public void testGetList() {
//		mapper.getList().forEach(board -> log.info(board));  //람다식
//	}
//	@Test
//	public void testInsert() {
//		Board board = new Board();
//		board.setTitle("새로 작성하는 글");
//		board.setContent("새로 작성하는 내용");
//		board.setWriter("newbie");
//		mapper.insert(board);
//		log.info(board);
//	}
//
//	@Test
//	public void testInsertSelectKey() {
//		Board board = new Board();
//		board.setTitle("새로 작성하는 글");
//		board.setContent("새로 작성하는 내용");
//		board.setWriter("newbie");
//		mapper.insertSelectKey(board);
//		log.info(board);
//	}

	@Test
	public void testRead() {
		//	int result = mapper.increaseHit(5);
		Board board = mapper.read(5);
		//log.info(result);
		log.info(board);
	}

	@Test
	public void testDelete() {
		log.info("DELETE COUNT : "+mapper.delete(5));
	}
	@Test
	public void testUpdate() {
		Board board = new Board();
		board.setBno(2);
		board.setTitle("수정한 제목");
		board.setContent("수정한 내용");
		int count =  mapper.update(board);
		log.info("UPDATE COUNT : "+count);
	}



}
