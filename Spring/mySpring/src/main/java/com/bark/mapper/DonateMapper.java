package com.bark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.bark.domain.Adoption;
import com.bark.domain.Donate;


@Mapper
public interface DonateMapper {
	@Insert("insert into donation (Id,shelter_shelterNo,state,amount)"
			+ "values(#{Id},#{shelterNo},#{state},#{amount})")
	public int insert(Donate donate);
	
	@Select("select * from donation where donationNo > 0")
	public List<Donate>getList();
	
	
	//관리자페이지 기부내역
	@Select("select d.donationno no, d.id id, u.name userName, s.shelterName,d.amount,d.paymentDate,d.state\r\n"
			+" from donation d join user u on d.id = u.id\r\n"
			+" join shelter s on s.shelterno = d.shelter_shelterno;")
	public List<Adoption> donationList();
	//기부상태로 검색
	@Select("select d.donationno no, d.id id, u.name userName, s.shelterName,d.amount,d.paymentDate,d.state\r\n"
			+" from donation d join user u on d.id = u.id\r\n"
			+" join shelter s on s.shelterno = d.shelter_shelterno\r\n"
			+ " where ${param1} like concat('%',#{param2},'%')")
	public List<Adoption> getSearchDonation(String filter, String input);
	//검색창으로 검색
	@Select("select d.donationno no, d.id id, u.name userName, s.shelterName,d.amount,d.paymentDate,d.state\r\n"
			+" from donation d join user u on d.id = u.id\r\n"
			+" join shelter s on s.shelterno = d.shelter_shelterno"
			+ "	where ${param1} like concat('%',#{param2},'%') and state=${param3};")
	public List<Adoption> getDonationState(String filter, String input, int state);

	//회원페이지 기부내역
	@Select("select donationno no,shelterName,amount,paymentDate,state from donation natural join shelter where id=#{id} ")
	public List<Donate> userDonationList(String id);
}
