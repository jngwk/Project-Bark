package com.bark.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bark.service.DonateService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/donates")
@RestController
@Log4j
@AllArgsConstructor
public class DonateController {
    private DonateService donateService;

//    @PostMapping("/donate")
//    public String donate(@RequestBody Donate donate) {
//        donateService.saveDonate(donate);
//        return "Donation saved successfully";
//    }
}