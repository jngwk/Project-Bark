package com.bark.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bark.domain.Adoption;
import com.bark.domain.User;
import com.bark.service.AdoptionService;
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
}
