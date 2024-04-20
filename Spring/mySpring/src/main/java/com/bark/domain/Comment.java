package com.bark.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Comment {
	private Integer commentNo;   	// 댓글번호
	private Integer board_bno;		// 게시판번호
	private String 	user_id;		// 작성자
	private String	content;		// 내용
	private	Date	regDate;		// 등록일
}
