package com.bark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bark.domain.Adoption;
import com.bark.domain.Dog;
import com.bark.domain.User;
import com.bark.mapper.AdoptionMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class AdoptionService {
	@Setter(onMethod_=@Autowired)
	private AdoptionMapper mapper;
	
	public List<Dog> getDogList(){
		log.info("getDogList..................");
		return mapper.getDogList();
	}
	
	public Dog getDog(int dogno) {
		log.info("getDog..................");
		return mapper.getDog(dogno);
	}
	
	public List<Adoption> getAdoptionList(){
		log.info("getAdoptionList..................");
		return mapper.getAdoptionList();
	}

	public List<Adoption> getSearchAdoption(String filter, String input) {
		return mapper.getSearchAdoption(filter,input);
	}

	public List<Adoption> getUserState(String filter, String input, int state) {
		// TODO Auto-generated method stub
		return mapper.getUserState(filter,input,state);
	}
}
