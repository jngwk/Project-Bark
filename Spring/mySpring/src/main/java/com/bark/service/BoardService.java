package com.bark.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bark.domain.Attached;
import com.bark.domain.Board;
import com.bark.domain.Criteria;
import com.bark.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardService {
	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;

//	@Setter(onMethod_ =@Autowired)
//	private BoardAttachMapper attachMapper;

	// 게시판 전체 건수 얻기
	public int totalPage(Criteria cri) {
		return mapper.totalPage(cri);
	}
	// 게시판 ? page, 10 건 가져오기, 1page 10건 처리
	public List<Board> list(Criteria cri) {	//화면에서 받은 type(게시판 구분)의 (다건)Board를 리턴
		return mapper.list(cri);
	}
	
	// 게시판 조회 조건으로 ? page, 10 건 가져오기, 1page 10건 처리
	public List<Board> searchList(Criteria cri) {	//화면에서 받은 type(게시판 구분)의 (다건)Board를 리턴
		System.out.println("Service.searchList : " + cri);
		
		List <Board> bList = new ArrayList<Board>();
		
		// 리스트 GET
		bList = mapper.searchList(cri);
		
		// 캠페인인 경우 저장된 이미지를 포함하여 가져온다.
		if (cri.getType() == 3) {
			
			// 첨부파일 리스트 GET
			bList.forEach(board -> 
			{	
				List<Attached> attachList = new ArrayList<Attached>();
				attachList = mapper.getAttachList(board.getBno());
				board.setAttachList(attachList);
				
				// 첫 이미지를 캠페인 대표 이미지로 Keep 
				attachList.forEach(attach -> 
				{
					// 첨부파일 타입이 1(true)이면 이미지 0(false)이면 첨부파일 
					if (attach.isFileType()) {
						board.setUploadPath(attach.getUploadPath()); 
						board.setFileName(attach.getFileName());
					}
				});
			});
			
			
		}
		System.out.println("Service.bList : " + bList);
		
		return bList;
	}
	
	public List<Board> searchListById(Criteria cri,String id) {	//화면에서 받은 type(게시판 구분)의 (다건)Board를 리턴
		log.info("searchListById : " + cri);
		return mapper.searchListById(cri,id);
	}

	public Board read(Integer bno) {	//화면에서 받은 type(게시판 구분)의 (다건)Board를 리턴
		Board board = new Board();

		board = mapper.read(bno);
		// 첨부파일 list get
//		board.setAttachList(attachMapper.list(board.getBno()));

		return board;
	}
	
	@Transactional
	public int write(Board board) {
		int result = mapper.write(board);
//		if (board.getAttachList() == null || board.getAttachList().size()<=0) {
//			return result;
//		}
//		board.getAttachList().forEach(attach->{
//			attach.setBno(board.getBno());
//			System.out.println("attach : " + attach);
//			attachMapper.insert(attach);
//		});
		return result;
	}	
	
	@Transactional
	public void update(Board board) {
//		List<Attached> aList = new ArrayList<Attached>();

		mapper.update(board);						// 게시판 수정 
		
//		aList = attachMapper.list(board.getBno());	// 기존 첨부파일 확인 
//		
//		// 수정 첨부파일이 없으면 기존 attached 전체 삭제
//		if ((board.getAttachList() == null || board.getAttachList().size()<=0)) {
//			attachMapper.deleteList(board.getBno());
//		}
//		// 수정 첨부파일(board.getAttachList())과 기존 첨부파일(aList) 비교하여 삭제 or 저장 
//		else {
//			
//			
//			// 기존 첨부파일 삭제
//			aList.forEach(attach ->{
//				boolean flag = true;
//				// forEach 안에 forEach를 사용하면 flag 값 처리가 불가능함  
//				for(int i=0; i<board.getAttachList().size(); i++) {
//					if(board.getAttachList().get(i).getUuid() == attach.getUuid()) {
//						flag = false;
//						continue;
//					}	
//				}
//				if (flag) {
//					attachMapper.delete(attach.getUuid()); // 기존 첨부파일 삭제
//				}
//			});
//			
//			// 람다식을 사용하면 오류발생하여 for문으로 처리  
//			// board.getAttachList().forEach(attach->{
//			for(int i=0; i<board.getAttachList().size(); i++) {	
//
//				boolean flag = true;
//				for(int j=0; j< aList.size(); j++) {
//					if(aList.get(j).getUuid() == board.getAttachList().get(i).getUuid()) {
//						flag = false;
//						continue;
//					}
//				}
//				// 기존 첨부파일에 수정 첨부파일이 없으면(true) 수정 첨부파일 저장  
//				if (flag) {
//					attachMapper.insert(board.getAttachList().get(i));
//				}
//			}
//		}
		return;
	}
	
	@Transactional
	public int delete(Integer bno) {
		return mapper.delete(bno); 
	}
	
	// 조회수 증가 처리
	public int updateHit(Integer bno) {
		return mapper.updateHit(bno); 
	}
	// 좋아요 증가 처리
	public int updateAddLike(Integer bno) {
		return mapper.updateAddLike(bno); 
	}
	
	// 좋아요 감소 처리
	public int updateSubtractLike(Integer bno) {
		return mapper.updateSubtractLike(bno); 
	}
	

	
	// start ---------------TEST---------------
	// dummy 게시판 Data 생성시 필요
	// User 테이블의 회원 Id List 추출 
	public List<String> getId() {
		return mapper.getId(); 
	}
	// end -------------------------------------


	
		
}
