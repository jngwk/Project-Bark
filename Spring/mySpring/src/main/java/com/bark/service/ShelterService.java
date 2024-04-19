package com.bark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bark.domain.Shelter;
import com.bark.mapper.ApiMapper;

import lombok.Setter;

@Service
public class ShelterService {
	@Setter(onMethod_=@Autowired)
	private ApiMapper mapper;
	
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
}
