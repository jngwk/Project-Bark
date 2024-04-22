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

	public boolean register(Shelter shelter) {
		int result = mapper.register(shelter);
		if(result == 1) {
			return true;
		}
		return false;
		
	}
}
