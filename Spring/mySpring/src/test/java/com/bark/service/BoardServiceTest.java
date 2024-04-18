package com.bark.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bark.domain.Board;
import com.bark.domain.Criteria;
import com.bark.domain.Page;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTest {
	@Setter(onMethod_= {@Autowired})
	private BoardService service;

//	@Test
//	public void testExist() {
//		log.info(service);
//		assertNotNull(service);
//	}
//
//	@Test 
//	public void testGetList() {
//		service.getList().forEach(board->log.info(board)); 
//	}
//	@Test
//	public void testWrite() {
//		Board board = new Board();
//		board.setTitle("새글 새글 새글 from Service");
//		board.setContent("새 내용 새 내용 from Service");
//		board.setWriter("newbie");
//		service.write(board);
//		log.info("생성된 게시물의 번호 : " +board.getBno());
//	}
//	@Test
//	public void testRead() {
//		log.info(service.read(6).getTitle());
//	}
//	@Test
//	public void testDelete() {
//		log.info("REMOVE RESULT : "+service.remove(6));
//	}
//	@Test
//	public void testUpdate() {
//		Board board = service.read(7);
//		if(board ==null) {return;}
//		board.setTitle("제목 수정 from Service");
//		log.info("MODIFY RESULT : "+service.modify(board));
//	}
	
	@Test
	public void searchList() {	//화면에서 받은 type를 가진 (다건)board를 리턴
		
		Integer pageNum = null;
		Integer	amount 	= null;
		int type  	= 2;
		String searchField = "title";
		String searchWord = "e_1";

		// pageNum, amount를 객체에 Set
		Criteria cri = new Criteria();
		if (pageNum == null) {   		// 값이 없으면 0 Set
			pageNum = 0; 
		}
		if (amount == null) {			// 값이 없으면 10 Set		
			amount = 10;
		}
		
		cri.setPageNum(pageNum);
		cri.setAmount(amount);

		int total = service.totalPage(type, searchField, searchWord);
		// 화면 page 처리
		Page page = new Page(cri, total);

		//log.info(service.list(cri, type));  // List test 
		log.info(service.searchList(cri, type, searchField, "%" + searchWord + "%")); // searchList
		log.info(page);
	}
	
	@Test
	public void write() {	
		Board board = new Board();
		
		//board.setBno(101);
		board.setId("user01");
		board.setTitle("강아지이야기");
		board.setContent("강아지가 크면 개가 됩니다.");
		//board.setRegDate(null);
		board.setHit(0);
		board.setLikea(0);
		board.setType(3);

		log.info(service.write(board));

	}

//	@Test
//	public void read() {	
//		Board board = new Board();
//		
//		board.setBno(101);
//		//board.setId("user01");
//		//board.setTitle("강아지이야기");
//		//board.setContent("강아지는 고양이와 친하다.");
//		//board.setRegDate(null);
//		//board.setHit(1);
//		//board.setLike(1);
//		//board.setType(3);
//
//		log.info(service.read(board.getBno()));
//		
//	}
	
//	@Test
//	public void update() {	
//		Board board = new Board();
//		
//		board.setBno(101);
//		//board.setId("user01");
//		board.setTitle("강아지이야기");
//		board.setContent("강아지는 고양이와 친하다.");
//		//board.setRegDate(null);
//		//board.setHit(1);
//		//board.setLike(1);
//		//board.setType(3);
//
//		service.update(board);
//
//	}
	
	@Test
	public void updateHit() {	
		Board board = new Board();
		
		board.setBno(101);
		//board.setId("user01");
		//board.setTitle("강아지이야기");
		//board.setContent("강아지는 고양이와 친하다.");
		//board.setRegDate(null);
		//board.setHit(1);
		//board.setLike(1);
		//board.setType(3);

		log.info(service.updateHit(board.getBno()));

	}
	
	@Test
	public void updateAddLike() {	
		Board board = new Board();
		
		board.setBno(101);
		//board.setId("user01");
		//board.setTitle("강아지이야기");
		//board.setContent("강아지는 고양이와 친하다.");
		//board.setRegDate(null);
		//board.setHit(1);
		//board.setLike(1);
		//board.setType(3);

		log.info(service.updateAddLike(board.getBno()));

	}
	@Test
	public void updateSubtractLike() {	
		Board board = new Board();
		
		board.setBno(101);
		//board.setId("user01");
		//board.setTitle("강아지이야기");
		//board.setContent("강아지는 고양이와 친하다.");
		//board.setRegDate(null);
		//board.setHit(1);
		//board.setLike(1);
		//board.setType(3);

		log.info(service.updateSubtractLike(board.getBno()));

	}

	@Test
	public void delete() {	
		Board board = new Board();
		
		board.setBno(52);
		//board.setId("user01");
		//board.setTitle("강아지이야기");
		//board.setContent("강아지는 고양이와 친하다.");
		//board.setRegDate(null);
		//board.setHit(1);
		//board.setLike(1);
		//board.setType(3);

		log.info(service.delete(board.getBno()));
	}
	
	
	// 가상 data Insert 
	@Test
	public void dummyInsert() {
		Board board = new Board();

		List<String> idList = new ArrayList<String>();
		idList  = service.getId();				// user 테이블의 id와 맞추기 위해 처리
		
		int cnt = idList.size();
		if (cnt > 0) {
			cnt = (cnt > 30)? 30 : cnt ;   			// user id가 30개가 넘을 경우 30개만 사용
			for (int i = 0; i < 100; i++) {
				//board.setBno(i);					// AUTO_INCREMENT
				board.setId(idList.get(i % cnt));
				board.setTitle("Title_" + i);
				board.setContent("Content_" + i);
				//board.setRegDate(null);			// default 현재일시
				board.setHit(0);
				board.setLikea(0);
				board.setType((i % 4)+1);

				service.write(board);
			}
		}
		
	}

}
