package com.bark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bark.domain.Board;
import com.bark.domain.Criteria;

public interface BoardMapper {
	
	@Select("SELECT COUNT(1) FROM board WHERE type = #{type} "
			  + " AND ((#{searchField} = 'title' AND title LIKE #{searchWord}) "
			  + " OR   (#{searchField} = 'content' AND content LIKE #{searchWord}) "
			  + " OR   (#{searchField} = 'id' AND id LIKE #{searchWord}) "
			  + " OR   (#{searchField} is null ) OR (#{searchField} = '')) ")
		public int totalPage(@Param("type") Integer type, 
				  			 @Param("searchField") String searchField, 
				  			 @Param("searchWord") String searchWord	);
		
		// 게시판별(type) 검색 단어(searchWord)가 없을 때 page별 조회
		@Select("SELECT ROW_NUMBER() OVER(ORDER BY b.bno ASC) AS no, b.*"
			  + " FROM board b WHERE type = #{type} ORDER BY no DESC LIMIT #{cri.pageNum}, #{cri.amount}")
		public List<Board> list(@Param("cri") Criteria cri, @Param("type") Integer type);

		// 게시판별(type) 검색 단어(searchWord)가 있을 때 page별 조회 
		@Select("SELECT ROW_NUMBER() OVER(ORDER BY b.bno ASC) AS no, b.*"
				  + " FROM board b WHERE type = #{type} "
				  + " AND ((#{searchField} = 'title' AND title LIKE #{searchWord}) "
				  + " OR   (#{searchField} = 'content' AND content LIKE #{searchWord}) "
				  + " OR   (#{searchField} = 'id' AND id LIKE #{searchWord}) "
				  + " OR   (#{searchField} is null ) OR (#{searchField} = '')) "
				  + " ORDER BY no DESC LiMIT #{cri.pageNum}, #{cri.amount}")
		public List<Board> searchList(@Param("cri") Criteria cri, @Param("type") Integer type, 
									  @Param("searchField") String searchField, @Param("searchWord") String searchWord	);
		
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
		@Update("UPDATE board SET likea = likea + 1 WHERE bno = #{bno}")
		public int updateAddLike(Integer bno);
		
		// 좋아요 취소 처리
		@Update("UPDATE board SET likeA = likeA - 1 WHERE bno = #{bno}")
		public int updateSubtractLike(Integer bno);

		@Delete("DELETE FROM board WHERE bno = #{bno}")
		public int delete(Integer bno);	
		
		// dummy 게시판 Data 생성시 필요 ------TEST--------------
		// User 테이블의 회원 Id List 추출 
		@Select("SELECT id FROM user ")
		public List<String> getId();

}
