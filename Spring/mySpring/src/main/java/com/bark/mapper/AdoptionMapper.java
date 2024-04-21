package com.bark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.bark.domain.Criteria;
import com.bark.domain.Dog;

@Mapper
public interface AdoptionMapper {
	@Select("select d.dogno, d.breed, d.name, s.shelterName, a.imgUrl "
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
		
	@Select("SELECT ROW_NUMBER() OVER (ORDER BY dogno DESC) AS row_num, d.*, a.imgUrl "
			+ "FROM dog d "
			+ "	join attach a "
			+ "		on d.dogno = a.dog_dogno "
			+ "ORDER BY dogno DESC "
			+ "LIMIT #{cri.pageSql}, #{cri.amount}")
	public List<Dog> searchList(@Param("cri") Criteria cri);
}
