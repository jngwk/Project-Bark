package com.bark.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bark.domain.Donate;
import com.bark.domain.Reply;
import com.bark.service.DonateService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/donate")
@RestController
@Log4j
@AllArgsConstructor
public class DonateController {
    private DonateService donateService;

    @PostMapping(value="/new",
    		consumes="application/json",
    		produces= {MediaType.TEXT_PLAIN_VALUE})
    		public int create(@RequestBody Donate donate){
    		log.info("Donate : "+donate);
    		
    		return donateService.insert(donate);    		

    		}
    		

}