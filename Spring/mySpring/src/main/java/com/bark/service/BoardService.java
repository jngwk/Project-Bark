package com.bark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bark.domain.Board;
import com.bark.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardService {
	@Setter(onMethod_=@Autowired)
	   private BoardMapper mapper;
	
	public List<Board> getList() {
		   log.info("getList..............."); 
		   return mapper.getList(); 
		}
		public void write(Board board) {
		   log.info("write...."+board.getBno());
		   mapper.insertSelectKey(board); 
		}
		public Board read(Integer bno) {
		   log.info("get...." + bno);
		   return mapper.read(bno);
		}
		public boolean modify(Board board) {
		   log.info("modify....."+board);
		   return mapper.update(board)==1;
		}
		public boolean remove(Integer bno) {
		   log.info("remove...."+bno);
		   return mapper.delete(bno)==1;
		}

		
}
