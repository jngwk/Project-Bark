package com.bark.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bark.domain.Comment;
import com.bark.mapper.BoardMapper;
import com.bark.mapper.UserMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CommentServiceTest {
	@Setter(onMethod_=@Autowired)
	private CommentService service;
	
//	Board board = new Board();
	
	@Test
	public void insert() {
		Comment comment = new Comment();

//		comment.setCommentNo(null);   // AUTO_INCREMENT
		comment.setBoard_bno(100);
		comment.setUser_id("user02");
		comment.setContent("나도 댓글입니다.");
//		comment.setRegDate(null);     // default now()

		log.info(service.insert(comment));
		
	}
	
	@Test
	public void read() {
		Comment comment = new Comment();

		comment.setCommentNo(1);   // AUTO_INCREMENT
//		comment.setBno(100);
//		comment.setId("user01");
//		comment.setContent("댓글입니다.");
//		comment.setRegDate(null);     // default now()

		log.info(service.read(comment.getCommentNo()));
		
	}
	
	@Test
	public void list() {
		Comment comment = new Comment();

//		comment.setCommentNo(1);   // AUTO_INCREMENT
		comment.setBoard_bno(100);
//		comment.setId("user01");
//		comment.setContent("댓글입니다.");
//		comment.setRegDate(null);     // default now()

		log.info(service.list(comment.getBoard_bno()));
	}
	
	@Test
	public void update() {
		Comment comment = new Comment();

		comment.setCommentNo(1);   // AUTO_INCREMENT
//		comment.setBno(100);
//		comment.setId("user01");
		comment.setContent("수정 댓글입니다.");
//		comment.setRegDate(null);     // default now()

		log.info(service.update(comment));
	}
	
	@Test
	public void delete() {
		Comment comment = new Comment();

		comment.setCommentNo(3);   			// AUTO_INCREMENT
//		comment.setBno(100);
//		comment.setId("user01");
//		comment.setContent("수정 댓글입니다.");
//		comment.setRegDate(null);    		// default now()

		log.info(service.delete(comment.getCommentNo()));
	}
	
	@Setter(onMethod_=@Autowired)
	private BoardMapper boardmapper;

	
	@Test
	public void dummyInsert() {
		Comment comment = new Comment();

		List<String> idList = new ArrayList<String>();
		idList  = boardmapper.getId();				// user 테이블의 id와 맞추기 위해 처리
		
		List<Integer> bnoList = new ArrayList<Integer>();
		bnoList  = boardmapper.getBno();				// user 테이블의 id와 맞추기 위해 처리
		
		int cnt1 = idList.size();
		int cnt2 = bnoList.size();
		if (cnt1 > 0 && cnt2 > 0) {
			cnt1 = (cnt1 > 30)? 30 : cnt1 ;   			// user id가 30개가 넘을 경우 30개만 사용
			cnt2 = (cnt2 > 30)? 40 : cnt2 ;   			// user id가 30개가 넘을 경우 30개만 사용
			for (int i = 0; i < 100; i++) {

				//comment.setCommentNo(i);					// AUTO_INCREMENT
				comment.setBoard_bno(bnoList.get(i % cnt2));
				comment.setUser_id(idList.get(i % cnt1));
				comment.setContent("Comment Content_" + i);
				//comment.setRegDate(null);
				
				service.insert(comment);
			}
		}
		
	}
}
