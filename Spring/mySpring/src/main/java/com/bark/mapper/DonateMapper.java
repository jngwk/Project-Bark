package com.bark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.bark.domain.Donate;


@Mapper
public interface DonateMapper {
	@Insert("insert into donation (Id,shelter_shelterNo,state,amount)"
			+ "values(#{Id},#{shelterNo},#{state},#{amount})")
	public int insert(Donate donate);
	
	@Select("select * from donation where donationNo > 0")
	public List<Donate>getList();
}
