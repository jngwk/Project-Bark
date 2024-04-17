package com.bark.mapper;

import org.apache.ibatis.annotations.Insert;

import com.bark.domain.Shelter;

public interface ApiMapper {
	@Insert("insert into shelter (shelterName, shelterAddr, lat, lng) values(#{shelterName},#{shelterAddr},#{lat},#{lng})")
	public void putShelter(Shelter shelter);
	
}
