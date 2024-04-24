package com.bark.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bark.domain.Adoption;
import com.bark.domain.Criteria;
import com.bark.domain.Dog;
import com.bark.domain.DogAttached;
import com.bark.domain.Donate;
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
	
	
	//입양목록 및 상세보기 관련
	public List<Dog> getDogList(){	//입양하기 -> 강아지 리스트
		return mapper.getDogList();
	}
	
	public Dog getDog(int dogno) {	//입양 상세 -> 강아지 상세정보
		log.info("getDog..................");
		return mapper.getDog(dogno);
	}
	
	public List<Dog> searchList(Criteria cri) {	// 강아지 조회 조건으로 ? page, 10 건 가져오기, 1page 10건 처리
		log.info("searchList : " + cri);
		return mapper.searchDogList(cri);
	}
	
	// 보호소 조회에서 입양 목록 넘어올 때
	public List<Dog> searchListByShelterno(Criteria cri, Integer shelterno) {
		log.info("searchListByShelterno : " + cri);
		log.info("searchListByShelterno : " + shelterno);
		return mapper.searchDogListByShelterno(cri, shelterno);
	}

	//입양하기 검색
	public List<Dog> dogListSearch(String filter, String input) {
		return mapper.dogListSearch(filter,input);
	}
	
	// 입양 상세 -> 입양 신청 처리
	public void adoptionWrite(Adoption adoption) {
		log.info("adoptionWrite : " + adoption);
		mapper.adoptionWrite(adoption);
		return;
	}
	// 입양 상세 -> 입양 신청 처리
	public void adoptionUpdateDog(Integer dogno, Integer available) {
		log.info("adoptionUpdateDog : " + dogno);
		mapper.adoptionUpdateDog(dogno, available);
		return;
	}
	
	
	
	//관리자페이지 입양내역 검색
	public List<Adoption> getAdoptionList(){
		log.info("getAdoptionList..................");
		return mapper.getAdoptionList();
	}
	
	public List<Adoption> searchAdoptionList(Criteria cri){	//한 페이지당 입양내역 리스트
		log.info("searchAdoptionList: "+ cri);
		return mapper.searchAdoptionList(cri);
	}
	

	public List<Adoption> getSearchAdoption(String filter, String input) {
		return mapper.getSearchAdoption(filter,input);
	}

	public List<Adoption> getUserState(String filter, String input, int state) {
		// TODO Auto-generated method stub
		return mapper.getUserState(filter,input,state);
	}
	

	
	//강아지 파일 업로드
	public List<DogAttached> getAttachList(Integer dogno) {	
		log.info("get Attach list by dogno" + dogno);
		return attachMapper.findByDogno(dogno);
	}
	
	@Transactional
	public void write(Dog dog) {
		
		dog.setShelterno(mapper.getShelterno(dog.getShelterName()));	//입력받은 보호소이름으로 보호소 번호 가져와서 해당 강아지에 추가
		mapper.insertSelectKey(dog);
		log.info("write...." + dog.getDogno());
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

	//회원페이지 입양내역
	public List<Adoption> userAdoptionList(String id) {
		return mapper.userAdoptionList(id);
	}

	public List<Adoption> getAState(String id,int state) {
		return mapper.getAState(id,state);
	}
	
	//보호소페이지 입양내역
	public List<Adoption> shelterAdoptionList(String id) {
		return mapper.shelterAdoptionList(id);
	}

	public int totalPage(Criteria cri) {
		return mapper.totalPage(cri);
	}

	

}
