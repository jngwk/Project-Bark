package com.bark.domain;

import lombok.Data;

@Data
public class Criteria {
	private Integer type;			// 게시판 종류 1: 공지 2: 자유 3: 보호소 이야기 4: 문의하기 5: 입양 게시판
	private Integer pageNum;  		// 화면의 pageNujm
	private Integer pageSql;  		// Sql에서 쓰이는 page
	private Integer amount;			// Sql에서 쓰이는 한페이지당 row 수
	private String	searchField;	// 게시판 조회시 속성명
	private String	searchWord;		// 게시판 조회시 검색단어
	private String	searchWordSql;	// Sql에서 쓰일 검색단어
}
