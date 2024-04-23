package com.bark.domain;

import lombok.Data;

@Data
public class Adoption {
	private int adoptionno;
	private String id;
	private int dogno;
	private String userName;
	private String shelterName;
	private String dogName;
	private String adopt_date;
	private int state;
	
}
