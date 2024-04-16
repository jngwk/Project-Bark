package com.bark.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/donation/*")
@AllArgsConstructor
public class DonationController {
	@GetMapping("/form")
	public void form() {
		log.info("form...........");
	}
}
