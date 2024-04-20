package com.bark.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Dog {
	private Integer dogno;
	private String shelterId;
	private String name;
	private String gender;
	private String breed;
	private String age;
	private Integer available;
	private String desc;
	private Date replyDate;
	private Integer neuter;
	private List<DogAttached> attachList;
}
