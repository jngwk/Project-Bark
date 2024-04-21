package com.bark.domain;

import lombok.Data;

@Data
public class Dog {
	private int dogno;
	private String gender;	//성별
	private String breed;	//품종
	private String age;
	private String feature;
	private int neuter;
	private int available;
	private String shelterName;
	private String imgUrl;
}
