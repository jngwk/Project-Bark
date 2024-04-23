package com.bark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bark.domain.Attached;
import com.bark.domain.Board;
import com.bark.domain.Criteria;

public interface BoardMapper {
	
	@Select("SELECT COUNT(1) FROM board WHERE type = #{cri.type} "
			  + " AND ((#{cri.searchField} = 'title' AND title LIKE #{cri.searchWordSql}) "
			  + " OR   (#{cri.searchField} = 'content' AND content LIKE #{cri.searchWordSql}) "
			  + " OR   (#{cri.searchField} = 'id' AND id LIKE #{cri.searchWordSql}) "
			  + " OR   (#{cri.searchField} is null ) OR (#{cri.searchField} = '')) ")
		public int totalPage(@Param("cri") Criteria cri);
		
		// 게시판별(type) 검색 단어(searchWord)가 없을 때 page별 조회
		@Select("SELECT ROW_NUMBER() OVER(ORDER BY b.bno ASC) AS no, b.*"
			  + " FROM board b WHERE type = #{cri.type} ORDER BY no DESC LIMIT #{cri.pageNum}, #{cri.amount}")
		public List<Board> list(@Param("cri") Criteria cri);

		// 게시판별(type) 검색 단어(searchWord)가 있을 때 page별 조회 
		@Select("SELECT ROW_NUMBER() OVER(ORDER BY b.bno ASC) AS no, b.*"
				  + " FROM board b WHERE type = #{cri.type} "
				  + " AND ((#{cri.searchField} = 'title' AND title LIKE #{cri.searchWordSql}) "
				  + " OR   (#{cri.searchField} = 'content' AND content LIKE #{cri.searchWordSql}) "
				  + " OR   (#{cri.searchField} = 'id' AND id LIKE #{cri.searchWordSql}) "
				  + " OR   (#{cri.searchField} is null ) OR (#{cri.searchField} = '')) "
				  + " ORDER BY no DESC LiMIT #{cri.pageSql}, #{cri.amount}")
		public List<Board> searchList(@Param("cri") Criteria cri);
		
		@Select("SELECT ROW_NUMBER() OVER(ORDER BY b.bno ASC) AS no, b.*"
				  + " FROM board b WHERE type = #{cri.type} "
				  + " AND id = #{id}"
				  + " AND ((#{cri.searchField} = 'title' AND title LIKE #{cri.searchWordSql}) "
				  + " OR   (#{cri.searchField} = 'content' AND content LIKE #{cri.searchWordSql}) "
				  + " OR   (#{cri.searchField} is null ) OR (#{cri.searchField} = '')) "
				  + " ORDER BY no DESC LiMIT #{cri.pageSql}, #{cri.amount}")
		public List<Board> searchListById(@Param("cri") Criteria cri,@Param("id") String id);
		
		// 게시글 등록
		@Insert("INSERT INTO board VALUES(null, #{id}, #{title}, #{content}, now(), 0, 0, #{type})")
		public int write(Board board);
		
		// 단건 조회
		@Select("SELECT * FROM board WHERE bno = #{bno}")
		public Board read(Integer bno);
		
		// 게시판 수정
		@Update("UPDATE board SET title = #{title}, content = #{content} WHERE bno = #{bno}")
		public int update(Board board);
		
		// 조회 수 증가 처리 
		@Update("UPDATE board SET hit = hit + 1 WHERE bno = #{bno}")
		public int updateHit(Integer bno);
		
		// 좋아요 증가 처리
		@Update("UPDATE board SET vote = vote + 1 WHERE bno = #{bno}")
		public int updateAddLike(Integer bno);
		
		// 좋아요 취소 처리
		@Update("UPDATE board SET vote = vote - 1 WHERE bno = #{bno}")
		public int updateSubtractLike(Integer bno);

		@Delete("DELETE FROM board WHERE bno = #{bno}")
		public int delete(Integer bno);	
		
		// dummy 게시판 Data 생성시 필요 ------TEST--------------
		// User 테이블의 회원 Id List 추출 
		@Select("SELECT id FROM user ")
		public List<String> getId();
		
		@Select("SELECT bno FROM board ORDER BY bno DESC ")
		public List<Integer> getBno();
		
		// 캠페인 리스트의 첨부파일 추출 
		@Select("SELECT imgno, bno, dogno, imgUrl, uploadpath, filename, filetype, uuid "
			  + " FROM  attach "
			  + " WHERE bno = #{bno} " ) 
		public List<Attached> getAttachList(@Param("bno") Integer bno);

}
