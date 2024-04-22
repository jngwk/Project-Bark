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
import com.bark.domain.Shelter;
import com.bark.domain.User;
import com.bark.service.AdoptionService;
import com.bark.service.DonateService;
import com.bark.service.ShelterService;
import com.bark.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {
	private UserService service;
	private ShelterService shelterService;
	private DonateService donateservice;
	private AdoptionService adoptionservice;

	@GetMapping("/userList")
	public void userList(Model model) {
		log.info("userList");
		model.addAttribute("uList", service.getUserList());
	}

	/*
	 * @GetMapping("/adminList") public void adminList(Model model) {
	 * log.info("adminList"); model.addAttribute("aList", service.getAdminList()); }
	 */
	/*
	 * @PostMapping("/login") public String login(String id, String pwd, HttpSession
	 * session) { log.info("login"); User user = service.getUser(id);
	 * if(user.getPwd().equals(pwd)) { session.setAttribute("userId", id);
	 * session.setAttribute("userType", user.getType());
	 * session.setAttribute("userName", user.getName()); } return "redirect:/"; }
	 */

	@RequestMapping(value = "login", produces = "application/json; charset=utf8", method = RequestMethod.POST)
	@ResponseBody
	public int login(@RequestParam("id") String id, @RequestParam("pwd") String pwd, HttpSession session) {
		log.info("login..................");
		User user = service.getUser(id);
		log.info("id: " + id);
		if (user == null) {
			return 0;
		} else if (user.getAvailable() == 2) {
			return 2;
		} else if (user.getPwd().equals(pwd)) {
			session.setAttribute("userId", id);
			session.setAttribute("userType", user.getType());
			session.setAttribute("userName", user.getName());
			session.setAttribute("userPhone", user.getPhone());
			return 1;
		} else if (!user.getPwd().equals(pwd)) {
			return -1;
		}
		return -2;
	}

	@PostMapping(value = "join", produces = "application/json; charset=utf8")
	@ResponseBody
	public boolean join(User user) {
		log.info("join: " + user);
		if (!service.join(user))
			return false;
		if (user.getType() == 2) {
			Shelter shelter = new Shelter();
			shelter.setShelterName(user.getName());
			shelter.setShelterAddr(user.getAddr());
			if (!shelterService.register(shelter))
				return false;
		}
		return true;
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
		if (user.getType() == 3) {
//			관리자일 경우, 직원 관리 페이지로 이동
			return "redirect:/adminList";
		} else {
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

	@PostMapping(value = "updatePwd", produces = "application/json; charset=utf8")
	@ResponseBody
	public int updatePwd(@RequestParam("email") String email, @RequestParam("pwd") String pwd) {
		int result = service.updateUserPwd(email, pwd);
		log.info("result: " + result);
		return result;
	}

	@GetMapping("/userWriteList")
	public void userWriteList() {
		log.info("userWriteList...........");
	}

	// 유저 페이지 관리
	@GetMapping("/userDonationList")
	public String userDonationList(@RequestParam("id") String id,Model model) {

		log.info("userDonationList...........");
		List<Donate> dList = donateservice.userDonationList(id);

		model.addAttribute("dList", dList);

		return "/user/userDonationList";
	}

	@GetMapping("/userAdoptionList")
	public String userAdoptionList(@RequestParam("id") String id,Model model) {

		log.info("userAdoptionList...........");
		List<Adoption> aList = adoptionservice.userAdoptionList(id);

		model.addAttribute("aList", aList);

		return "/user/userAdoptionList";
	}
}
