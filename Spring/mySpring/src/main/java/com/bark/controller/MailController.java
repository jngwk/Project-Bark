package com.bark.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bark.domain.Mail;
import com.bark.service.MailService;
import com.bark.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/mail/*")
@AllArgsConstructor
public class MailController {
	@Autowired
	private MailService mailService;
	private UserService service;
	
	@GetMapping("/authCheck")
	@ResponseBody
	public int mail() {
		int authNumber = mailService.makeRandomNumber();
		return authNumber;

	}
	
	@GetMapping("/mailCheck")
	@ResponseBody //@ResponseBody: 자바 객체를 json 기반의 HTTP Body로 변환
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.joinEmail(email);
	}
	
	@GetMapping("/sendCode")
	@ResponseBody //@ResponseBody: 자바 객체를 json 기반의 HTTP Body로 변환
	public void sendVerificationCode(@RequestParam ("email") String email) {
		log.info(email);
		Mail mail = mailService.setAuthMail(email);
		mailService.sendMail(mail);
		log.info("회원가입 이메일 전송 --------------");
	}
	@RequestMapping(value="sendCodeAndId", produces = "application/json; charset=utf8")
	@ResponseBody //@ResponseBody: 자바 객체를 json 기반의 HTTP Body로 변환
	public String sendCodeAndId(@RequestParam ("email") String email) {
		log.info(email);
		String id = service.getUserId(email);
		Mail mail = mailService.setAuthMail(email, id);
		mailService.sendMail(mail);
		log.info("계정찾기 이메일 전송 --------------");
		return id;
	}
	
	@RequestMapping(value="verifyCode", produces = "application/json; charset=utf8")
	@ResponseBody //@ResponseBody: 자바 객체를 json 기반의 HTTP Body로 변환
	public boolean verifyCode(@RequestParam ("email") String email, @RequestParam("code") String code) {
		log.info(email + " + " + code);
		boolean isVerified = mailService.verifyCode(email, Integer.parseInt(code));
		log.info("코드 확인 ---------------");
		return isVerified;
	}
	
	@GetMapping("/deleteCode")
	@ResponseBody //@ResponseBody: 자바 객체를 json 기반의 HTTP Body로 변환
	public void deleteCode(@RequestParam ("email") String email) {
		log.info(email);
		mailService.deleteCode(email);
	}
}
