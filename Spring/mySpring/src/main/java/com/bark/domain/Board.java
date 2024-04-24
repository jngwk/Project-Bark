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
	private Integer	type;		// 1: 공지사항, 2: 문의하기, 3:캠페인 
	private String	uploadPath;	// 캠페인 리스트 조회시 대표 이미지 경로
	private String	fileName;	// 캠페인 리스트 조회시 대표 이미지 명
	private String  shelterName;// 캠페인 리스트 조회시 보호소명
	private String uuid;		// 캠페인 filename과 합쳐서 사진파일 이름 만들기
	private List<Attached> attachList; 
}

