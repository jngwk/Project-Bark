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
	public List<Donate> donationList() {
		// TODO Auto-generated method stub
		return mapper.donationList();
	}
	
	public List<Donate> getSearchDonation(String filter, String input) {
		// TODO Auto-generated method stub
		return mapper.getSearchDonation(filter,input);
	}

	public List<Donate> getDonationState(String filter, String input, int state) {
		// TODO Auto-generated method stub
		return mapper.getDonationState(filter,input,state);
	}

	//회원페이지 기부내역
	public List<Donate> userDonationList(String id) {
		return mapper.userDonationList(id);
	}
	//개인 처리상태
	public List<Donate> getDState(String id,int state) {
		// TODO Auto-generated method stub
		return mapper.getDState(id,state);
	}
	//보호소페이지 기부내역
	public List<Donate> shelterDonationList(String id) {
		return mapper.shelterDonationList(id);
	}
	//보호소 처리상태
	public List<Donate> getSDState(String id, int state) {
		// TODO Auto-generated method stub
		return mapper.getSDState(id,state);
	}




}
