package com.bark.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bark.domain.User;
import com.bark.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {
	private UserService service;
	
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
	@PostMapping("/login")
	public String login(String id, String pwd, HttpSession session) {
		log.info("login");
		User user = service.getUser(id);
		if(user.getPwd().equals(pwd)) {
			session.setAttribute("userId", id);
			session.setAttribute("userType", user.getType());
			session.setAttribute("userName", user.getName());
		}
		return "redirect:/";
	}
	
	@PostMapping("/join")
	public String join(User user, RedirectAttributes rttr) {
		log.info("join: " + user);
		boolean result = service.join(user);
		rttr.addFlashAttribute("result", result);
		return "redirect:/";
	}
	
	@GetMapping("/userDetail")
	public void userDetail(@RequestParam("id") String id, Model model) {
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
}
