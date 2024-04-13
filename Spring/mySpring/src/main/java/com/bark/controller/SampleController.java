package com.bark.controller;

import java.util.ArrayList;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bark.domain.SampleDTO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/sample/*")
public class SampleController {
	@RequestMapping("/test")
	public void test() {
		log.info("testing...........");
	}

	@GetMapping("/ex01") 
	public String ex01(SampleDTO dto) {
		log.info("" + dto);
		return "ex01"; 
	}
	
	@GetMapping("/ex02")
	public String ex02(@RequestParam("name") String name, @RequestParam("age") int age) {
		log.info("name : " + name);
		log.info("age : " + age);
		return "ex02";
	}

	@GetMapping("/ex02List")
	public String ex02List(@RequestParam("ids")ArrayList<String> ids) {
		log.info("ids" +ids);
		return "ex02List";
	}
	
	@GetMapping("/ex04")
	public String ex04(SampleDTO dto, @ModelAttribute("page") int page) {
		log.info("dto:" + dto);
		log.info("page: " + page);
		return "/sample/ex04";
	}
	
	@GetMapping("/ex06") 
	public @ResponseBody SampleDTO ex06() {
	   log.info("ex06............... ");
	   SampleDTO dto = new SampleDTO();
	   dto.setAge(10); dto.setName("conan"); 
	   return dto; 
	}
	
	@GetMapping("/ex07") 
	public ResponseEntity <String> ex07() {
	   log.info("ex07........"); 
	   String msg = String.format("{\"name\":\"conan\"}");
	   HttpHeaders header = new HttpHeaders(); 
	   header.add("Content-Type", "application/json;charset=UTF-8"); 
	   return new ResponseEntity<>(msg, header,HttpStatus.OK); 
	}

}
