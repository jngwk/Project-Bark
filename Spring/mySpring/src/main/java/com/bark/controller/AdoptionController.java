package com.bark.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bark.domain.Criteria;
import com.bark.domain.Page;
import com.bark.service.AdoptionService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/adoption/*")
@AllArgsConstructor
public class AdoptionController {
	private AdoptionService service;
	
	@GetMapping("/list")
	public void list(Model model,
			 @RequestParam(required=false, value="pageNum") Integer pageNum,
			 @RequestParam(required=false, value="amount") Integer amount) {
		log.info("list...........");
		
		Integer type = 5;	//입양 게시판
		System.out.println("noticeList type-feild-pageNum-amount : " + type + "-" + pageNum + "-" + amount);
		
		// pageNum, amount를 객체에 Set
		Criteria cri = new Criteria();
		
		if (pageNum == null) {   		// 값이 없으면 0 Set
			pageNum = 1; 
		}
		if (amount == null) {			// 값이 없으면 10 Set		
			amount = 10;
		}

		cri.setPageNum(pageNum);
		// sql에서 쓰이는 Limit에서는 0 부터 시작 하므로 -1 처리 
		cri.setPageSql((pageNum -1)* 10);
		cri.setAmount(amount);
		cri.setType(type);				// 입양게시판 "5"
		
		// 조회 조건에 따른 전게 건수 
		int total = service.getDogList().size();	//201마리
		Page page = new Page(cri, total);
		
		model.addAttribute("page", page);
		model.addAttribute("dogList", service.searchList(cri));
	}
		
	@GetMapping("/detail")
	public String detail(@RequestParam("dogno") int dogno, Model model) {
		log.info("detail...........");
		model.addAttribute("dog", service.getDog(dogno));
		return "adoption/detail";
	}
}
