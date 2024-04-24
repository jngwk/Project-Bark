package com.bark.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Dog {
	private Integer dogno; 
	private Integer shelterno;
	private String shelterName;
	private Integer bno; 
	private Integer adoptionno;  
	private String 	name; 
	private String 	gender; 
	private String 	breed; 
	private String 	age; 
	private Integer available; 
	private String 	feature; 
	private Date   	regDate; 
	private Integer neuter; 
	private String 	careTel;
	private String shelterAddr;
	private String imgUrl;
	private String uuid;
	private String filename;
	private String filePath;
	private List<DogAttached> dogAttachedList; 
}
