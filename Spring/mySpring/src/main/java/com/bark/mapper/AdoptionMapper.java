package com.bark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.bark.domain.Adoption;
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
	
	@Select("select a.adoptionno no, a.user_id id, u.name, s.shelterName,d.name dogName,a.adopt_date date,a.state\r\n"
		+ "	from adoption a join user u on a.user_id = u.id\r\n"
		+ "    join dog d on d.adoption_adoptionno = a.adoptionno\r\n"
		+ "    join shelter s on s.shelterno = d.shelter_shelterno;")
	public List<Adoption> getAdoptionList();

	@Select("select a.adoptionno no, a.user_id id, u.name, s.shelterName,d.name dogName,a.adopt_date date,a.state\r\n"
			+ "	from adoption a join user u on a.user_id = u.id\r\n"
			+ "    join dog d on d.adoption_adoptionno = a.adoptionno\r\n"
			+ "    join shelter s on s.shelterno = d.shelter_shelterno\r\n"
			+ "where ${param1} like concat('%',#{param2},'%')")
	public List<Adoption> getSearchAdoption(String filter,String input);

	
	@Select("select a.adoptionno no, a.user_id id, u.name, s.shelterName,d.name dogName,a.adopt_date date,a.state\r\n"
			+ "	from adoption a join user u on a.user_id = u.id\r\n"
			+ "    join dog d on d.adoption_adoptionno = a.adoptionno\r\n"
			+ "    join shelter s on s.shelterno = d.shelter_shelterno\r\n"
			+ "where ${param1} like concat('%',#{param2},'%') and state=#{param3};")
	public List<Adoption> getUserState(String filter,String input,int state);
}
