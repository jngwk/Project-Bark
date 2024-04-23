package com.bark.domain;

import java.util.Date;

import lombok.Data;
@Data
public class Donate {

	private String id;
	private String shelterno;
	private Integer state;
	private Integer amount;
	private Integer no;
	private String shelterName; 
	private String paymentDate;
	
}
