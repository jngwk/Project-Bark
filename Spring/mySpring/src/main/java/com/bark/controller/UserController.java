package com.bark.controller;

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

import com.bark.domain.User;
import com.bark.service.MailService;
import com.bark.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {
	private UserService service;
	private MailService mailservice;
	
	@GetMapping("/userList")
	public void userList(Model model) {
		log.info("userList");
		model.addAttribute("uList", service.getUserList());
	}
	
	@GetMapping("/adminList")
	public void adminList(Model model) {
		log.info("adminList");
		model.addAttribute("aList", service.getAdminList());
	}
	/*
	 * @PostMapping("/login") public String login(String id, String pwd, HttpSession
	 * session) { log.info("login"); User user = service.getUser(id);
	 * if(user.getPwd().equals(pwd)) { session.setAttribute("userId", id);
	 * session.setAttribute("userType", user.getType());
	 * session.setAttribute("userName", user.getName()); } return "redirect:/"; }
	 */
	
	@RequestMapping(value="login", produces = "application/json; charset=utf8", method = RequestMethod.POST)
	@ResponseBody
	public int login(@RequestParam("id") String id, @RequestParam("pwd") String pwd, HttpSession session){
		log.info("login..................");
		User user = service.getUser(id);
		log.info("id: " + id);
		if(user == null) {
			return 0;
		}
		else if(user.getPwd().equals(pwd)) {
			session.setAttribute("userId", id);
			session.setAttribute("userType", user.getType());
			session.setAttribute("userName", user.getName());
			return 1;
		}
		else if(!user.getPwd().equals(pwd)){
			return -1;
		}
		return -2;
	}
	
	@PostMapping(value="join",produces = "application/json; charset=utf8")
	@ResponseBody
	public boolean join(User user) {
		log.info("join: " + user);
		boolean result = service.join(user);
		return result;
	}
	
	@GetMapping("/userDetail")
	public void userDetail(@RequestParam("id") String id, Model model, HttpSession session) {
		log.info("userDetail");
		model.addAttribute("user", service.getUser(id));
	}
	@PostMapping("/modify")
	public String modify(User user, RedirectAttributes rttr) {
		log.info("modify");
		boolean result = service.modify(user);
		rttr.addFlashAttribute("result", result);
		return "redirect:/user/userDetail";
	}
	
	@PostMapping("/delete")
	public String delete(User user, RedirectAttributes rttr) {
		log.info("delete");
		boolean result = service.delete(user);
		rttr.addFlashAttribute("result", result);
		if(user.getType() == 3) {
//			관리자일 경우, 직원 관리 페이지로 이동
			return "redirect:/adminList";
		}
		else {
			return "redirect:/";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		log.info("logout");
		session.removeAttribute("userId");
		session.removeAttribute("userType");
		session.removeAttribute("userName");
		return "redirect:/";
	}
	
	@PostMapping(value="checkId",produces = "application/json; charset=utf8")
	@ResponseBody
	public int checkId(@RequestParam("id") String id){
		int cnt = -1;
		if(id != "") {
			cnt = service.checkId(id);
			log.info(id + ": " +cnt);
		}
		return cnt;
	}
	
	@PostMapping(value="findAcc",produces = "application/json; charset=utf8")
	@ResponseBody
	public int findAcc(@RequestParam("name") String name, @RequestParam("email") String email){
		int result= service.findAcc(name, email);
		log.info(name + " + " + email);
		log.info("result: " + result);
		return result;
	}
	
	
	
	@GetMapping("/mail")
	public void mail() {
		
	}
	
	@GetMapping("/mailCheck")
	@ResponseBody //@ResponseBody: 자바 객체를 json 기반의 HTTP Body로 변환
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailservice.joinEmail(email);
	}
	
	@GetMapping("/userWriteList")
	public void userWriteList() {
		log.info("userWriteList...........");
	}
}
