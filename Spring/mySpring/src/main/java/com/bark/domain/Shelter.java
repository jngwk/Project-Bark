package com.bark.domain;

import lombok.Data;

@Data
public class Shelter {
	private Integer shelterno; // db에서 shelterno
	private String shelterName;
	private String shelterAddr;
	private Double lat; //x좌표
	private Double lng; //y좌표
	private String careTel;

	public Shelter() {
		
	}
	
	public Shelter(String shelterName, String shelterAddr, Double lat, Double lng, String careTel) {
		super();
		this.shelterName = shelterName;
		this.shelterAddr = shelterAddr;
		this.lat = lat;
		this.lng = lng;
		this.careTel = careTel;
	}

}
