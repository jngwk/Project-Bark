package com.bark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.bark.domain.Shelter;

@Mapper
public interface ApiMapper {
	@Insert("insert into shelter (shelterName, shelterAddr, lat, lng) values(#{shelterName},#{shelterAddr},#{lat},#{lng})")
	public void putShelter(Shelter shelter);
	
	@Select("select * from shelter")
	public List<Shelter> getShelterList();

	@Select("select * from shelter where shelterName like concat('%',#{name},'%')")
	public List<Shelter> searchShelterName(String name);
	
	@Select("select * from shelter where shelterAddr like concat('%',#{addr},'%')")
	public List<Shelter> searchShelterAddr(String addr);
	
}
