package com.bark.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Reply {
	private Integer rno;
	private Integer bno;
	private String reply;
	private String replyer;
	private Date replyDate;
}
