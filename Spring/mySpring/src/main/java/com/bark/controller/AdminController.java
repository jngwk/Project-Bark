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

import com.bark.domain.User;
import com.bark.service.AdoptionService;
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
	
	
	@GetMapping("/donationList")
	public void donationList() {
		log.info("donationlist...........");
	}
	
	@GetMapping("/adminAdoptionList")
	public void adminAdoptionList(Model model) {
		log.info("adminAdoptionList...........");
		
	}
}
