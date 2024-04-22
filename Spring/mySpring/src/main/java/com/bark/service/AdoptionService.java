package com.bark.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bark.domain.Criteria;
import com.bark.domain.Dog;
import com.bark.domain.DogAttached;
import com.bark.mapper.AdoptionMapper;
import com.bark.mapper.DogAttachMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class AdoptionService {
	@Setter(onMethod_=@Autowired)
	private AdoptionMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private DogAttachMapper attachMapper;
	
	public List<Dog> getDogList(){	//입양하기 -> 강아지 리스트
		log.info("getDogList..................");
		return mapper.getDogList();
	}
	
	public Dog getDog(int dogno) {	//입양 상세 -> 강아지 상세정보
		log.info("getDog..................");
		return mapper.getDog(dogno);
	}
	
	// 강아지 조회 조건으로 ? page, 10 건 가져오기, 1page 10건 처리
	public List<Dog> searchList(Criteria cri) {
		log.info("searchList : " + cri);
		return mapper.searchList(cri);
	}
	
	public List<DogAttached> getAttachList(Integer dogno) {	//강아지 파일 업로드
		log.info("get Attach list by dogno" + dogno);
		return attachMapper.findByDogno(dogno);
	}
	
	@Transactional
	public void write(Dog dog) {
		log.info("write...." + dog.getDogno());
		mapper.insertSelectKey(dog);
		if (dog.getDogAttachedList() == null || dog.getDogAttachedList().size() <= 0) {
			return;
		}
		dog.getDogAttachedList().forEach(dogattach -> { // 첨부 파일이 있는 경우
			System.out.println("dogAttach : " + dogattach);
			dogattach.setDogno(dog.getDogno());
			attachMapper.insert(dogattach);
		});
	}
	
	public Dog read(Integer dogno) {
		log.info("get...." + dogno);
		return mapper.read(dogno);
	}

	public boolean modify(Dog dog) {
		log.info("modify....." + dog);
		return mapper.update(dog) == 1;
	}

	public boolean remove(Integer dogno) {
		log.info("remove...." + dogno);
		return mapper.delete(dogno) == 1;
	}
}
