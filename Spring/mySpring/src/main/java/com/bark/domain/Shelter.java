package com.bark.domain;

import lombok.Data;

@Data
public class Shelter {
	private String shelterName;
	private String shelterAddr;
	private Double lat; //x좌표
	private Double lng; //y좌표

	public Shelter() {
		
	}
	
	public Shelter(String shelterName, String shelterAddr, Double lat, Double lng) {
		super();
		this.shelterName = shelterName;
		this.shelterAddr = shelterAddr;
		this.lat = lat;
		this.lng = lng;
	}

	public Double getLat() {
		return lat;
	}

	public void setLat(Double lat) {
		this.lat = lat;
	}

	public Double getLng() {
		return lng;
	}

	public void setLng(Double lng) {
		this.lng = lng;
	}

	public String getShelterName() {
		return shelterName;
	}
	public void setShelterName(String shelterName) {
		this.shelterName = shelterName;
	}
	public String getShelterAddr() {
		return shelterAddr;
	}
	public void setShelterAddr(String shelterAddr) {
		this.shelterAddr = shelterAddr;
	}
}
