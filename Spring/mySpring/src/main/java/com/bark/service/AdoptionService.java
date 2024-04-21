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
	
	public List<Dog> getDogList(){	//입양하기 -> 강아지 리스트
		log.info("getDogList..................");
		return mapper.getDogList();
	}
	
	public Dog getDog(int dogno) {	//입양 상세 -> 강아지 상세정보
		log.info("getDog..................");
		return mapper.getDog(dogno);
	}
}
