package com.bark.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bark.domain.Adoption;
import com.bark.domain.Criteria;
import com.bark.domain.Page;
import com.bark.domain.User;
import com.bark.service.AdoptionService;
import com.bark.service.BoardService;
import com.bark.service.DonateService;
import com.bark.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminController {
	private UserService userservice;
	private AdoptionService adoptionservice;
	private DonateService donateservice;
	private BoardService service;
	
	//회원조회
	@GetMapping("/userList")
	public String userList(Model model) {
		log.info("userlist...........");
		List<User> uList = userservice.getUserList();
		log.info(uList);
		
		model.addAttribute("uList",uList);
		return "/admin/userList";
	}
	
	@PostMapping(value="getUserType",produces = "application/json; charset=utf8")
	@ResponseBody
	public List<User> getUserType(@RequestParam ("filter") String filter,@RequestParam ("input") String input,@RequestParam ("type") String type,Model model) {
		log.info("-------sheltername search mapping o--------");
		log.info(type);
		return userservice.getUserType(filter,input,Integer.parseInt(type));
	}
	
	@PostMapping(value="getSearchUser",produces = "application/json; charset=utf8")
	@ResponseBody
	public List<User> getSearchUser(@RequestParam ("filter") String filter,@RequestParam ("input") String input,Model model) {
		log.info(filter); log.info(input);
		return userservice.getSearchUser(filter,input);
	}
	
	@GetMapping("/available")
	public String availableUpdate(@RequestParam ("available") String available,@RequestParam ("id") String id, RedirectAttributes rttr) {
		log.info("available");
		boolean result = userservice.availableUpdate(available,id);
		rttr.addFlashAttribute("result", result);

		return "redirect:/admin/userList";
	}
	
	//기부내역
	@GetMapping("/donationList")
	public String donationList(Model model) {
		log.info("donationlist...........");
		List<Adoption> dList = donateservice.donationList();
		
		model.addAttribute("dList",dList);
		return "/admin/donationList";
	}
	
	@PostMapping(value="getSearchDonation",produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Adoption> getSearchDonation(@RequestParam ("filter") String filter,@RequestParam ("input") String input,Model model) {
		log.info(filter); log.info(input);
		return donateservice.getSearchDonation(filter,input);
	}
	
	 @PostMapping(value="getDonationState",produces = "application/json; charset=utf8")
	 @ResponseBody
	 public List<Adoption> getDonationState(@RequestParam ("filter") String filter,@RequestParam ("input") String input,
			 @RequestParam ("state") String state,Model model) {
		 log.info("-------Donation search mapping o--------");
		 log.info(state);
		 return donateservice.getDonationState(filter,input,Integer.parseInt(state));
	 }
	 
	 
	//입양내역
	@GetMapping("/adminAdoptionList")
	public String adminAdoptionList(Model model) {
		log.info("adminAdoptionList...........");
		List<Adoption> aList = adoptionservice.getAdoptionList();
		
		model.addAttribute("aList",aList);
		return "/admin/adminAdoptionList";
		
	}
	
	 @PostMapping(value="getUserState",produces = "application/json; charset=utf8")
	 @ResponseBody
	 public List<Adoption> getUserState(@RequestParam ("filter") String filter,@RequestParam ("input") String input,
			 @RequestParam ("state") String state,Model model) {
		 log.info("-------sheltername search mapping o--------");
		 log.info(state);
		 return adoptionservice.getUserState(filter,input,Integer.parseInt(state));
	 }
	 
	
	@PostMapping(value="getSearchAdoption",produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Adoption> getSearchAdoption(@RequestParam ("filter") String filter,@RequestParam ("input") String input,Model model) {
		log.info(filter); log.info(input);
		return adoptionservice.getSearchAdoption(filter,input);
	}
	
	@GetMapping("/userWriteList")//다건
	public void noticeList(Model model,
	   @RequestParam(required=false, value="searchField") String searchField,
	   @RequestParam(required=false, value="searchWord") String searchWord,
	   @RequestParam(required=false, value="pageNum") Integer pageNum,
	   @RequestParam(required=false, value="amount") Integer amount) {

		Integer type = 2;   				// 문의사항
		System.out.println("contactList [" + type +"-"+ searchField + "-" + searchWord + "-" + pageNum + "-" + amount + "]");

		// pageNum, amount를 객체에 Set
		Criteria cri = new Criteria();
		
		if (pageNum == null || pageNum == 0) { // 값이 없으면 0 Set
			pageNum = 1; 
		}
		if (amount == null) {			// 값이 없으면 10 Set		
			amount = 10;
		}
		if (searchField == null || searchField == "") {
			searchField = "";
			searchWord = "";
		}
		if (searchWord == null || searchWord == "") {
			searchField = "";
			searchWord = "";
		}

		cri.setPageNum(pageNum);
		// sql에서 쓰이는 Limit에서는 0 부터 시작 하므로 -1 처리 
		cri.setPageSql((pageNum -1)* 10);
		cri.setAmount(amount);
		cri.setType(type);					// 공지사항 "2"
		cri.setSearchField(searchField);
		cri.setSearchWord(searchWord);
		cri.setSearchWordSql("%" + searchWord + "%"); 

		// 조회 조건에 따른 전게 건수 
		int total = service.totalPage(cri);
		Page page = new Page(cri, total);
		
		model.addAttribute("page", page);
		model.addAttribute("bList", service.searchList(cri));
	}	
}
