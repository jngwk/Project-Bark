package com.bark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.bark.domain.Shelter;

@Mapper
public interface ShelterMapper {
	@Insert("insert into shelter (shelterName, shelterAddr, lat, lng,careTel) values(#{shelterName},#{shelterAddr},#{lat},#{lng},#{careTel})")
	public void putShelter(Shelter shelter);
	
//	@Insert("insert into shelter (shelterName, shelterAddr) values(#{shelterName},#{shelterAddr})")
	@SelectKey(statement = "SELECT shelterno('shelter')", keyProperty = "id", before = false, resultType = int.class)
	@Insert("INSERT INTO shelter (shelterName, shelterAddr) VALUES(#{shelterName}, #{shelterAddr})")
	public int register(Shelter shelter);
	
	@Select("select * from shelter")
	public List<Shelter> getShelterList();

	@Select("select * from shelter where shelterName like concat('%',#{name},'%')")
	public List<Shelter> searchShelterName(String name);
	
	@Select("select * from shelter where shelterAddr like concat('%',#{addr},'%')")
	public List<Shelter> searchShelterAddr(String addr);

	// kyw : 20240422-16:22  입양신청서(adoptiondetail.jsp) 처리시 조회 내용 
	@Select("select * from shelter where shelterno = #{shelterno}")
	public Shelter getShelter(@Param("shelterno") Integer shelterno);
	//--------------------------------
}
