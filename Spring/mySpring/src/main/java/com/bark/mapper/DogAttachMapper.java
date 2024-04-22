package com.bark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.bark.domain.DogAttached;

@Mapper
public interface DogAttachMapper {	//강아지 파일 관련(Adoption에서 사용)
	@Insert("insert into dogattach values(#{uuid}, #{uploadPath}, #{fileName}, #{fileType}, #{dogno}) ")
	public void insert(DogAttached vo);
	@Delete("delete from dogattach where uuid=#{uuid}")
	public void delete(String uuid);
	@Select("select * from dogattach where dogno=#{dogno}")
	public List<DogAttached> findByDogno(Integer dogNo);
	@Delete("delete from dogattach where dogno=#{dogno}")
	public void deleteAll(Integer dogNo);
	@Select("select * from dogattach where uploadpath = DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 1 DAY),'%Y\\%m\\%d' )")
	public List<DogAttached> getOldFiles();

}   
