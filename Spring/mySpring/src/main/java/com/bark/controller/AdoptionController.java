package com.bark.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public void list(Model model) {
		log.info("list...........");
		model.addAttribute("dList", service.getDogList());
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam("dogno") int dogno, Model model) {
		log.info("detail...........");
		model.addAttribute("dog", service.getDog(dogno));
		return "adoption/detail";
	}
}
