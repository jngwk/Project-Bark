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
	private Integer	likea;		// 추천수                                            
	private Integer	type;		// 종류 1: 공지 2: 자유 3: 보호소 이야기 4: 문의하기'
	//private List<Attached> attachList; 
	
}

