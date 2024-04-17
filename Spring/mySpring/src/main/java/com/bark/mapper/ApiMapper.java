package com.bark.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.bark.domain.Shelter;

@Mapper
public interface ApiMapper {
	@Insert("insert into shelter (shelterName, shelterAddr, lat, lng) values(#{shelterName},#{shelterAddr},#{lat},#{lng})")
	public void putShelter(Shelter shelter);
	
}
