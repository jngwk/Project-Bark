package com.bark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.bark.domain.Dog;

public interface DogMapper {
	@Select("select * from dog where dogno > 0")  //mapperTest에서 호출하였을때 구현하기 위함
	public List<Dog>getList();
	
	@Insert("insert into dog(shelterId, name, gender, breed, age, desc, neuter)"
			+ "values(#{shelterId}, #{name}, #{gender}, #{breed}, #{age}, #{desc}, #{neuter}) ")
	public int insert(Dog dog);
	
	@Insert("insert into dog(shelterId, name, gender, breed, age, `desc`, neuter)"
	        + "values(#{shelterId}, #{name}, #{gender}, #{breed}, #{age}, #{desc}, #{neuter})")
	@SelectKey(statement = "SELECT LAST_INSERT_ID()", keyProperty = "dogno", before = false, resultType = int.class)
	public void insertSelectKey(Dog dog);
	@Select("SELECT * FROM dog WHERE dogno = #{dogno}")
	public Dog read(int i);
	@Delete("DELETE FROM dog WHERE dogno = #{dogno}")
	public int delete(int i);
	@Update("UPDATE board SET shelterId = #{shelterId}, name = #{name}, gender = #{gender}, breed = #{breed}, age = #{age}, desc = #{desc}, neuter = #{neuter} WHERE dogno = #{dogno}")
	public int update(Dog dog);
}
