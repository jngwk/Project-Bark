package com.bark.domain;

import lombok.Data;

@Data
public class Donate {
	
	private Integer donationno;
	private String id;
	private String shelterno;
	private Integer state;
	private Integer amount;
	private String paymentDate;

	private Integer no;
	private String userName;
	private String shelterName; 
}
