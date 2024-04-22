package com.bark.domain;

import java.util.Date;

import lombok.Data;
@Data
public class Donate {

	private String user_Id;
	private String shelter_shelterNo;
	private Integer state;
	private Integer amount;
	private Integer no;
	private String shelterName; 
	private String paymentDate;
	
}
