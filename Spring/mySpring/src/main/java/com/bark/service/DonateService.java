package com.bark.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bark.domain.Donate;
import com.bark.mapper.DonateMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
public class DonateService {
	@Setter(onMethod_ = @Autowired)
	private DonateMapper mapper;
	
	public int insert(Donate donate) {
		log.info("donate...."+donate);
		return mapper.insert(donate);
	}
}
