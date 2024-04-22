package com.bark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.bark.domain.Adoption;
import com.bark.domain.Criteria;
import com.bark.domain.Dog;

@Mapper
public interface AdoptionMapper {	
	
	//입양목록 관련
		
	@Select("select d.dogno, d.gender, d.age, d.breed, d.available, s.shelterName, a.imgUrl"
			+ "			from dog d"
			+ "				join attach a"
			+ "						on d.dogno = a.dogno"
			+ "					inner join shelter s"
			+ "						on s.shelterno = d.shelterno"
			+ "					where d.dogno = #{dogno};")
	public Dog getDog(int dogno);	//특정 강아지 정보, detail

	
	@Select("SELECT ROW_NUMBER() OVER (ORDER BY dogno DESC) AS row_num, d.*, a.imgUrl "
			+ "FROM dog d "
			+ "	join attach a "
			+ "		on d.dogno = a.dogno"
			+ "	inner join shelter s"
			+ "		on s.shelterno = d.shelterno;")
	public List<Dog> getDogList();
	
	@Select("SELECT ROW_NUMBER() OVER (ORDER BY dogno DESC) AS row_num, d.*, a.imgUrl "
			+ "FROM dog d "
			+ "	join attach a "
			+ "		on d.dogno = a.dogno "
			+ "ORDER BY dogno DESC "
			+ "LIMIT #{cri.pageSql}, #{cri.amount}")
	public List<Dog> searchList(@Param("cri") Criteria cri);//한 페이지당 강아지 리스트

	
	//관리자 입양관리페이지
	@Select("select a.adoptionno no, a.id id, u.name userName, s.shelterName,d.name dogName,a.adopt_date date,a.state\r\n"
		+ "	from adoption a join user u on a.id = u.id\r\n"
		+ "    join dog d on d.adoptionno = a.adoptionno\r\n"
		+ "    join shelter s on s.shelterno = d.shelterno;")
	public List<Adoption> getAdoptionList();

	@Select("select a.adoptionno no, a.id id, u.name userName, s.shelterName,d.name dogName,a.adopt_date date,a.state\r\n"
			+ "	from adoption a join user u on a.id = u.id\r\n"
			+ "    join dog d on d.adoptionno = a.adoptionno\r\n"
			+ "    join shelter s on s.shelterno = d.shelterno\r\n"
			+ "where ${param1} like concat('%',#{param2},'%')")
	public List<Adoption> getSearchAdoption(String filter,String input);

	
	@Select("select a.adoptionno no, a.id id, u.name userName, s.shelterName,d.name dogName,a.adopt_date date,a.state\r\n"
			+ "	from adoption a join user u on a.id = u.id\r\n"
			+ "    join dog d on d.adoption_adoptionno = a.adoptionno\r\n"

			+ "    join shelter s on s.shelterno = d.shelterno\r\n"
			+ "where ${param1} like concat('%',#{param2},'%') and state=#{param3};")
	public List<Adoption> getUserState(String filter,String input,int state);
	
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

	@Insert("")
	public void insertAdoption();

	//회원페이지 입양내역
	@Select("select a.adoptionno no, s.shelterName,d.name dogName,a.adopt_date date ,a.state\r\n"
			+ "	from adoption a join dog d on d.adoptionno = a.adoptionno\r\n"
			+ "    join shelter s on s.shelterno = d.shelterno where id = #{id}")
	public List<Adoption> userAdoptionList(String id);
	
	@Select("select a.adoptionno no, s.shelterName,d.name dogName,a.adopt_date date ,a.state\r\n"
			+ "	from adoption a join dog d on d.adoptionno = a.adoptionno\r\n"
			+ "    join shelter s on s.shelterno = d.shelterno where id = #{param1} and state = ${param2}")
	public List<Adoption> getAState(String id,int state);
	
	
}
