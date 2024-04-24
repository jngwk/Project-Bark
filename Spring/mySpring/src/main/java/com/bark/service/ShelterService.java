package com.bark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bark.domain.Shelter;
import com.bark.domain.User;
import com.bark.mapper.ShelterMapper;

import lombok.Setter;

@Service
public class ShelterService {
	@Setter(onMethod_=@Autowired)
	private ShelterMapper mapper;
	
	public void putShelterInfo(Shelter shelter) {
		mapper.putShelter(shelter);
	}
	
	public List<Shelter> getShelterList() {;
		return mapper.getShelterList();
	}

	public List<Shelter> searchShelterName(String name) {
		return mapper.searchShelterName(name);
	}
	public List<Shelter> searchShelterAddr(String addr) {
		return mapper.searchShelterAddr(addr);
	}

	public int register(Shelter shelter) {
		return mapper.register(shelter);
		
	}
	
	// kyw : 20240424-11:41  캠페인 처리시 조회 내용  
	public Shelter getShelter(Integer shelterno) {
		return mapper.getShelter(shelterno);
	}
	//--------------------------------
}
