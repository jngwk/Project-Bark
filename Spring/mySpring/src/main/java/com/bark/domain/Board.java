package com.bark.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Board {
	private Integer no;			// 게시판 화면 번호
	private Integer	bno;		// 게시판번호                                                
	private String	id;			// 회원ID                                     
	private String	title;		// 제목                                   
	private String	content;	// 내용                               
	private Date	regDate;	// 등록일                       
	private Integer	hit;		// 조회수                                             
	private Integer	vote;		// 추천수                                            
	private Integer	type;		
	private List<Attached> attachList; 
	
}

