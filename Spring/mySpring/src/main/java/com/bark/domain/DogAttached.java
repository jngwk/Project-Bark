package com.bark.domain;

import lombok.Data;

@Data
public class DogAttached {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType; // 이미지파일여부
	private Integer dogno;
}