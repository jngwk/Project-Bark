package com.bark.domain;

import java.util.Date;

import lombok.Data;

@Data
public class User {
	private String id;
	private String pwd;
	private String name;
	private String phone;
	private String email;
	private String addr;
	private String addrDetail;
	private String postcode;
	private String bank;
	private String bankAcc;
	private Date regDate;
	private Integer available;
	private Integer type;
//	예금주 추가
}
