package com.bark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bark.domain.Comment;

@Mapper
public interface CommentMapper {
	
	@Insert("INSERT INTO comment (board_bno, user_id, content) VALUES(#{board_bno}, #{user_id}, #{content})")
	public int insert(Comment comment);
	
	@Select("SELECT * FROM comment WHERE commentNo=#{commentNo}")
	public Comment read(Integer commentNo);
		
	@Delete("DELETE FROM comment WHERE commentNo=#{commentNo}")
	public int delete(Integer commentNo);
	
	@Update("UPDATE comment SET content = #{content} where commentNo=#{commentNo}")
	public int update(Comment comment);
	
	@Select("SELECT * FROM comment WHERE board_bno=#{board_bno} ORDER BY commentNo DESC")
	public List<Comment> List(@Param("board_bno") Integer board_bno);

	// 게시판 read 에서 댓글 존재 여부 확인 
	// 댓글이 존재하면 게시판 수정 불가
	@Select("SELECT count(1) FROM comment WHERE board_bno=#{bno}")
	public int getCount(@Param("bno") Integer board_bno);
	// dummy 게시판 Data 생성시 필요 ------TEST--------------
	// User 테이블의 회원 Id List 추출 
	@Select("SELECT id FROM user ")
	public List<String> getId();
	
}