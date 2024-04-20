package com.bark.domain;

import java.util.Date;

import lombok.Data;
@Data
public class Donate {
	private Integer donationNo;
	private String userId;
	private String shelter_shelterno;
	private Integer state;
	private Integer amount;
	private Date paymentDate;
}
