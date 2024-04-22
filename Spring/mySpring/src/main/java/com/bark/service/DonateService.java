package com.bark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bark.domain.Adoption;
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

	//관리자페이지 기부내역
	public List<Adoption> donationList() {
		// TODO Auto-generated method stub
		return mapper.donationList();
	}
	
	public List<Adoption> getSearchDonation(String filter, String input) {
		// TODO Auto-generated method stub
		return mapper.getSearchDonation(filter,input);
	}

	public List<Adoption> getDonationState(String filter, String input, int state) {
		// TODO Auto-generated method stub
		return mapper.getDonationState(filter,input,state);
	}



}
