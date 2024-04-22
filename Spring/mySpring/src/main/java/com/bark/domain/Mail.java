package com.bark.domain;

import lombok.Data;

@Data
public class Mail {
	private String sender;
	private String receiver;
	private String title;
	private String content;
	private int code;
}
