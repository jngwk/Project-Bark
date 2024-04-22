package com.bark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.bark.domain.Attached;

@Mapper
public interface BoardAttachMapper {
	@Insert("insert into attach values(#{uuid}, #{uploadPath}, #{fileName}, #{fileType}, #{bno}) ")
	public void insert(Attached vo);
	@Delete("delete from attach where uuid=#{uuid}")
	public void delete(String uuid);
	@Select("select * from attach where bno=#{bno}")
	public List<Attached> findByBno(Integer bno);

	@Delete("delete from attach where bno=#{bno}")
	public void deleteAll(Integer bno);
	@Select("select * from attach where uploadpath = DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 1 DAY),'%Y\\%m\\%d' )")
	public List<Attached> getOldFiles();

}   
