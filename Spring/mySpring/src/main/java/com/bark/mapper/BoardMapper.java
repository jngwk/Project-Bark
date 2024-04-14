package com.bark.mapper;

import java.util.List;

import com.bark.domain.Board;

public interface BoardMapper {
	//	@Select("select * from board where bno > 0")
	public List<Board> getList();
	public int insert(Board board);
	public int insertSelectKey(Board board);
	public int increaseHit(Integer bno);
	public Board read(Integer bno);
	public int delete(Integer bno);
	public int update(Board board);
}
