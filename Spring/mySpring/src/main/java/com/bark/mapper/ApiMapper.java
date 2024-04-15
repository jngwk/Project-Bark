package com.bark.mapper;

import org.apache.ibatis.annotations.Insert;

public interface ApiMapper {
	@Insert("insert into shelter (shelterName, shelterAddr, lat, lng) values(#{name},#{addr},#{lat},#{lng})")
	public void putShelter(String name, String addr, Double lat, Double lng);
}
