package com.bark.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.bark.domain.Adoption;
import com.bark.domain.Donate;

import com.bark.domain.Criteria;
import com.bark.domain.Page;

import com.bark.domain.Shelter;
import com.bark.domain.User;

import com.bark.service.AdoptionService;
import com.bark.service.DonateService;

import com.bark.service.BoardService;

import com.bark.service.SecurityService;
import com.bark.service.ShelterService;
import com.bark.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {
	private BoardService boardservice;
	private UserService service;
	private ShelterService shelterService;
	private DonateService donateservice;
	private AdoptionService adoptionservice;
	private SecurityService securityService;

	@RequestMapping(value = "login", produces = "application/json; charset=utf8", method = RequestMethod.POST)
	@ResponseBody
	public int login(@RequestParam("id") String id, @RequestParam("pwd") String pwd, HttpSession session) {
		log.info("login..................");
		User user = service.getUser(id);
		log.info("id: " + id);
		if (user == null) {
			return 0;
		} else if (user.getAvailable() == 0) { // 처리중
			return 2;
		} else if (user.getAvailable() == 2) { // 처리중
			return 3;
		}else if (user.getPwd().equals(pwd)) {
			session.setAttribute("userId", id);
			session.setAttribute("userType", user.getType());
			session.setAttribute("userName", user.getName());
			session.setAttribute("userPhone", user.getPhone());
			session.setAttribute("userEmail", user.getEmail());
			return 1;
		} else if (!user.getPwd().equals(pwd)) {
			return -1;
		}
		log.info("eeeid: " + id);
		return -2;
	}

	@PostMapping(value = "join", produces = "application/json; charset=utf8")
	@ResponseBody
	public int join(User user) {
		log.info("join: " + user);
		if(user.getAddrDetail() != null) {
			user.setAddr(user.getAddr() + " " + user.getAddrDetail()); // 주소 한줄로 만들기
		}
		
		if (!service.join(user)) { // 일단 user db에 삽입
			return 0; // user 테이블 삽입 오류
		}
		
		if (user.getType() == 2) { // 보호소 회원이면
			if(user.getAddrDetail() != null) { // 세부 주소가 있으면 신규 보호소
				Shelter shelter = new Shelter();
				shelter.setShelterName(user.getName());
				shelter.setShelterAddr(user.getAddr());
				shelter.setCareTel(user.getPhone());
				shelterService.register(shelter);
				log.info(shelter.getShelterno());
				service.updateShelterno(user.getId(), shelter.getShelterno());
				log.info("신규 보호소: " + shelter.getShelterno() + "======");
				return 1;
			}
			else { // 주소가 있으면 등록된 보호소
				log.info("이미 등록된 보호소 ===========================");
				List<Shelter> sList = shelterService.getShelterList();
				if(sList.size() > 1) { 
					for(Shelter s : sList) {
						if(s.getShelterAddr().equals(user.getAddr())) { // 이름 중복 있으면 주소 맞는거 찾아서 shelterno 반환
							service.updateShelterno(user.getId(), s.getShelterno());
							return 1;
						}
					}
				}
				else {
					service.updateShelterno(user.getId(), sList.get(0).getShelterno());
					return 1;
				}
				
			}
		}
		
		return 1;
	}

	@GetMapping("/userDetail")
	public String userDetail(@RequestParam("id") String id, Model model, HttpSession session) {
		if(securityService.hasRole(1, session) || securityService.hasRole(2, session)) {
			log.info("userDetail");
			model.addAttribute("user", service.getUser(id));
			return "/user/userDetail";
		}
		return "main";
		
	}

	@PostMapping("/modify")
	public String modify(User user, RedirectAttributes rttr, HttpSession session) {
		if(securityService.hasRole(1, session) || securityService.hasRole(2, session)) {
			log.info("modify");
			boolean result = service.modify(user);
			rttr.addFlashAttribute("result", result);
			return "redirect:/user/userDetail";
		}
		return "main";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		log.info("logout");
		session.removeAttribute("userId");
		session.removeAttribute("userType");
		session.removeAttribute("userName");
		session.removeAttribute("userPhone");
		return "redirect:/";
	}

	@GetMapping(value = "getUser", produces = "application/json; charset=utf8")
	@ResponseBody
	public User getUser(@RequestParam("id") String id) {
		return service.getUser(id);
	}
	
	@PostMapping(value = "checkId", produces = "application/json; charset=utf8")
	@ResponseBody
	public int checkId(@RequestParam("id") String id) {
		int cnt = -1;
		if (id != "") {
			cnt = service.checkId(id);
			log.info(id + ": " + cnt);
		}
		return cnt;
	}

	@PostMapping(value = "checkEmail", produces = "application/json; charset=utf8")
	@ResponseBody
	public int findAcc(@RequestParam("email") String email) {
		int result = service.checkEmail(email);
		log.info(email);
		log.info("result: " + result);
		return result;
	}
	
	@PostMapping(value="updateUser",produces = "application/json; charset=utf8")
	@ResponseBody
	public int updateUser(
			 @RequestParam("id") String id,
			 @RequestParam("email") String email,						   
			 @RequestParam("phone") String phone,
			 @RequestParam("pwd") String pwd,
			 @RequestParam("addr") String addr,
			 @RequestParam("addrDetail") String addrDetail) {
		log.info("update user =======================");
		User user = service.getUser(id);
		// 비밀번호 변경 x시 기존 비밀번호 저장
		if(!pwd.equals("") && pwd != null) {
			user.setPwd(pwd);
		}
		user.setEmail(email);
		user.setPhone(phone);
		user.setAddr(addr+addrDetail);
		user.setAddrDetail(addrDetail);
		return service.updateUser(user);
	}
	

	@PostMapping(value = "updatePwd", produces = "application/json; charset=utf8")
	@ResponseBody
	public int updatePwd(@RequestParam("email") String email, @RequestParam("pwd") String pwd) {
		int result = service.updateUserPwd(email, pwd);
		log.info("result: " + result);
		return result;
	}
	
    //----------------------------------------------------------------------------------------------------------
	// 유저 페이지 기부 관리
	@GetMapping("/userDonationList")
	public String userDonationList(@RequestParam("id") String id,Model model, HttpSession session) {
		
		if(securityService.hasRole(1, session)) { //개인 페이지
			log.info("userDonationList...........");
			List<Donate> dList = donateservice.userDonationList(id);
	

			model.addAttribute("dList", dList);
	
			return "/mypage/userDonationList";
			
		}else if(securityService.hasRole(2, session)){ //보호소 페이지
			log.info("shelterDonationList...........");
			List<Donate> dList = donateservice.shelterDonationList(id);
	
			model.addAttribute("dList", dList);
	
			return "/mypage/shelterDonationList";
		}
		return "main";
	}
	//개인 처리상태
	 @PostMapping(value="getDState",produces = "application/json; charset=utf8")
	 @ResponseBody
	 public List<Donate> getDState(@RequestParam("id") String id,@RequestParam ("state") String state,Model model) {
		 log.info("-------Donation search mapping o--------");
		 log.info(state);
		 return donateservice.getDState(id,Integer.parseInt(state));
	 }
	 //보호소 처리상태
	 @PostMapping(value="getSDState",produces = "application/json; charset=utf8")
	 @ResponseBody
	 public List<Donate> getSDState(@RequestParam("id") String id,@RequestParam ("state") String state,Model model) {
		 log.info("-------Donation search mapping o--------");
		 log.info(state);
		 return donateservice.getSDState(id,Integer.parseInt(state));
	 }
	 
	 
    //---------------------------------------------------------------------------------------------------------
	// 유저 페이지 입양 관리
	@GetMapping("/userAdoptionList")
	public String userAdoptionList(@RequestParam("id") String id,Model model, HttpSession session) {
		
		if(securityService.hasRole(1, session) ) { //개인페이지
			log.info("userAdoptionList...........");
			List<Adoption> aList = adoptionservice.userAdoptionList(id);
	
			model.addAttribute("aList", aList);
	
			return "/mypage/userAdoptionList";
			
		}else if(securityService.hasRole(2, session)){ //보호소 페이지
			log.info("shelterAdoptionList...........");
			List<Adoption> aList = adoptionservice.shelterAdoptionList(id);
	
			model.addAttribute("aList", aList);
	
			return "/mypage/shelterAdoptionList";
		}
		return "main";
	}
	 @PostMapping(value="getAState",produces = "application/json; charset=utf8")
	 @ResponseBody
	 public List<Adoption> getAState(@RequestParam ("id") String id,@RequestParam ("state") String state,Model model) {
		 log.info("-------sheltername search mapping o--------");
		 log.info(state);
		 return adoptionservice.getAState(id,Integer.parseInt(state));
	 }
	 
	// 보호소 페이지 회원조회 보호소 승인
	@GetMapping("/adoptionState")
	public String adoptionState(@RequestParam("state") String state, @RequestParam("userId") String userId,@RequestParam("id") String id,
			RedirectAttributes rttr,Model model) {
		log.info(userId);
		log.info(id);
		
		boolean result = service.adoptionState(state, userId);
		rttr.addFlashAttribute("result", result);
		rttr.addAttribute("id", id);

		return "redirect:/user/userAdoptionList";
	}
	 
	 //---------------------------------------------------------------------------------------------------------

	@GetMapping("/userWriteList")//다건
	public void noticeList(Model model,
	   @RequestParam(required=false, value="searchField") String searchField,
	   @RequestParam(required=false, value="searchWord") String searchWord,
	   @RequestParam(required=false, value="pageNum") Integer pageNum,
	   @RequestParam(required=false, value="amount") Integer amount,
	   HttpSession session) {

		Integer type = 2;   				// 문의사항
		String id = (String)session.getAttribute("userId");
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
		int total = boardservice.totalPage(cri);
		Page page = new Page(cri, total);
		
		model.addAttribute("page", page);
		model.addAttribute("bList", boardservice.searchListById(cri,id));
	}	
	
	@GetMapping("/about")
	public void about() {
		
	}

}
