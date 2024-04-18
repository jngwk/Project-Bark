package com.bark.domain;

import lombok.Data;

@Data
public class Criteria {
	private Integer pageNum;  	// 자체적으로 쓰일때는 0 부터,
	                     		// page 클래스 안에서 쓰일대는 1부터
	private Integer amount;		// 한페이지당 row 수
}
