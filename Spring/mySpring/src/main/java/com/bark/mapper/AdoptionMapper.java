package com.bark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.bark.domain.Criteria;
import com.bark.domain.Dog;

@Mapper
public interface AdoptionMapper {
	@Select("select d.dogno, d.breed, s.shelterName, a.imgUrl "
			+ "from dog d "
			+ "	join attach a "
			+ "		on d.dogno = a.dog_dogno"
			+ "	inner join shelter s"
			+ "		on s.shelterno = d.shelter_shelterno;")
	public List<Dog> getDogList();
	
	@Select("select d.dogno, d.breed, d.gender, d.age, d.feature, d.neuter, d.available, s.shelterName, a.imgUrl "
			+ "from dog d "
			+ "	join attach a "
			+ "		on d.dogno = a.dog_dogno"
			+ "	inner join shelter s"
			+ "		on s.shelterno = d.shelter_shelterno"
			+ "	where dogno = #{dogno};")
	public Dog getDog(int dogno);
	
	
	@Insert("INSERT INTO adoption VALUSE(null, ${user_id}, ${dogno}, null, null, 1);")
	public int insert(@Param("user_id") String user_id, @Param("dogno") String dogno);
	
	@Select("SELET adoptionno VALUSE(null, ${user_id}, null, null, 1);")
	public int getAdoptionNo(int dogno);
	
	
}
