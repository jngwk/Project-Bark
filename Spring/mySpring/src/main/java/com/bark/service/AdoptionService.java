package com.bark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bark.domain.Dog;
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
}
