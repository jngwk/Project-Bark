package com.bark.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bark.domain.Board;
import com.bark.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTest {
	@Setter(onMethod_= {@Autowired})
	private BoardService service;

	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}

	@Test 
	public void testGetList() {
		service.getList().forEach(board->log.info(board)); 
	}
	@Test
	public void testWrite() {
		Board board = new Board();
		board.setTitle("새글 새글 새글 from Service");
		board.setContent("새 내용 새 내용 from Service");
		board.setWriter("newbie");
		service.write(board);
		log.info("생성된 게시물의 번호 : " +board.getBno());
	}
	@Test
	public void testRead() {
		log.info(service.read(6).getTitle());
	}
	@Test
	public void testDelete() {
		log.info("REMOVE RESULT : "+service.remove(6));
	}
	@Test
	public void testUpdate() {
		Board board = service.read(7);
		if(board ==null) {return;}
		board.setTitle("제목 수정 from Service");
		log.info("MODIFY RESULT : "+service.modify(board));
	}


}
