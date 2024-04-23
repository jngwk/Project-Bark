package com.bark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.bark.domain.Adoption;
import com.bark.domain.Donate;


@Mapper
public interface DonateMapper {
//	@Insert("insert into donation "
//			+ "values(null, #{id}, #{shelterno}, #{state}, #{amount}, now())")
//	public int insert(Donate donate);
	
	@Insert("insert into donation (id,shelterno,state,amount)"
			+ "values(#{id},#{shelterno},#{state},#{amount})")
	public int insert(Donate donate);
	
	@Select("select * from donation where donationNo > 0")
	public List<Donate>getList();
	
	
	//관리자페이지 기부내역 전체
	@Select("select d.donationno, d.id id, u.name userName, s.shelterName,d.amount amount,d.paymentDate,d.state\r\n"
			+" from donation d join user u on d.id = u.id\r\n"
			+" join shelter s on s.shelterno = d.shelterno order by d.paymentDate desc;")
	public List<Donate> donationList();
	//관리자페이지 검색창
	@Select("select d.donationno, d.id id, u.name userName, s.shelterName,d.amount,d.paymentDate,d.state\r\n"
			+" from donation d join user u on d.id = u.id\r\n"
			+" join shelter s on s.shelterno = d.shelterno\r\n"
			+ " where ${param1} like concat('%',#{param2},'%') order by d.paymentDate desc")
	public List<Donate> getSearchDonation(String filter, String input);
	//관리자페이지 state
	@Select("select d.donationno, d.id id, u.name userName, s.shelterName,d.amount,d.paymentDate,d.state\r\n"
			+" from donation d join user u on d.id = u.id\r\n"
			+" join shelter s on s.shelterno = d.shelterno"
			+ "	where ${param1} like concat('%',#{param2},'%') and state=${param3} order by d.paymentDate desc;")
	public List<Donate> getDonationState(String filter, String input, int state);

	//회원페이지 기부내역 전체
	@Select("select donationno no,shelterName,amount,paymentDate,state from donation natural join shelter where id=#{id} ")
	public List<Donate> userDonationList(String id);
	//회원페이지 기부내역 state검색
	@Select("select donationno no,shelterName,amount,paymentDate,state from donation natural join shelter where id=#{param1} and state=${param2} ")
	public List<Donate> getDState(String id,int state);
}
