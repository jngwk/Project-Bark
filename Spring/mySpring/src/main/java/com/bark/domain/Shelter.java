package com.bark.domain;

import lombok.Data;

@Data
public class Shelter {
	private Integer shelterno; // db에서 shelterno
	private String shelterName;
	private String shelterAddr;


	public Shelter() {
		
	}
	
	public Shelter(String shelterName, String shelterAddr) {
		super();
		this.shelterName = shelterName;
		this.shelterAddr = shelterAddr;
	}

}
