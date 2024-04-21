package com.bark.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bark.domain.Dog;
import com.bark.domain.DogAttached;
import com.bark.mapper.DogAttachMapper;
import com.bark.mapper.DogMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class DogService {
	@Setter(onMethod_ = @Autowired)
	private DogMapper mapper;
	@Setter(onMethod_=@Autowired)
	private DogAttachMapper attachMapper;

	public List<Dog> getList() {
		log.info("getList...............");
		return mapper.getList();
	}

	public List<DogAttached> getAttachList(Integer dogno) {
	    log.info("get Attach list by dogno" + dogno); 
	    return attachMapper.findByDogno(dogno);
	 }

	@Transactional
	public void write(Dog dog) {
		log.info("write...."+dog.getDogno());
		mapper.insertSelectKey(dog); 
		if(dog.getAttachList()==null || dog.getAttachList().size()<=0) {
			return;
		}
		dog.getAttachList().forEach(dogattach->{  //첨부 파일이 있는 경우 
			System.out.println("dogAttach : "+dogattach);
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
