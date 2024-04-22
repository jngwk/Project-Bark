package com.bark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.bark.domain.Criteria;
import com.bark.domain.Dog;

@Mapper
public interface AdoptionMapper {
	@Select("select d.dogno, d.breed, d.name, s.shelterName, a.imgUrl "
			+ "from dog d "
			+ "	join attach a "
			+ "		on d.dogno = a.dogno"
			+ "	inner join shelter s"
			+ "		on s.shelterno = d.shelterno;")
	public List<Dog> getDogList();
	
	@Select("select d.dogno, d.gender, d.age, d.breed, s.shelterName, a.imgUrl \r\n"
			+ "	from dog d"
			+ "		join attach a"
			+ "			on d.dogno = a.dogno"
			+ "		inner join shelter s"
			+ "			on s.shelterno = d.shelterno"
			+ "		where d.dogno = #{dogno};")
	public Dog getDog(int dogno);
		
	@Select("SELECT ROW_NUMBER() OVER (ORDER BY dogno DESC) AS row_num, d.*, a.imgUrl "
			+ "FROM dog d "
			+ "	join attach a "
			+ "		on d.dogno = a.dogno "
			+ "ORDER BY dogno DESC "
			+ "LIMIT #{cri.pageSql}, #{cri.amount}")
	public List<Dog> searchList(@Param("cri") Criteria cri);
	
	@Select("select shelterno from shelter where shelterName = #{shelterName}")
	public int getSehterno(String shelterName);
	
	@Insert("insert into dog(shelterno, name, gender, breed, age, feature, neuter)"
			+ "values(#{shelterno}, #{name}, #{gender}, #{breed}, #{age}, #{feature}, #{neuter}) ")
	public int insert(Dog dog);	//이미지 파일 없는 강아지 
	
	@Insert("insert into dog(shelterno, name, gender, breed, age, feature, neuter)"
	        + "values(#{shelterno}, #{name}, #{gender}, #{breed}, #{age}, #{feature}, #{neuter})")
	@SelectKey(statement = "SELECT LAST_INSERT_ID()", keyProperty = "dogno", before = false, resultType = int.class)
	public void insertSelectKey(Dog dog);	//이미지 파일 있는 강아지 
	
	@Select("SELECT * FROM dog WHERE dogno = #{dogno}")
	public Dog read(int i);
	@Delete("DELETE FROM dog WHERE dogno = #{dogno}")
	public int delete(int i);
	@Update("UPDATE board SET shelterId = #{shelterId}, name = #{name}, gender = #{gender}, breed = #{breed}, age = #{age}, desc = #{desc}, neuter = #{neuter} WHERE dogno = #{dogno}")
	public int update(Dog dog);
}
