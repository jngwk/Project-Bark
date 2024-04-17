package com.bark.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.xml.sax.SAXException;

import com.bark.domain.Shelter;
import com.bark.service.ShelterService;
import com.bark.temp.ShelterInfo;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/shelter")
public class ShelterController {
	private ShelterService service;
	
	@GetMapping("/info")
    public void searchInfo(Model model) throws ParserConfigurationException, SAXException, IOException, ServletException {
        log.info("파싱 시작");

        ShelterInfo shelterinfo = new ShelterInfo();

        HashMap<String, Shelter> sMap = shelterinfo.getShelterInfo();

        log.info("데이터 저장 시작");
        for(Entry<String, Shelter> entrySet : sMap.entrySet()) {
        	service.putShelterInfo(entrySet.getValue());
        }
        model.addAttribute("sMap", sMap);

        log.info("데이터 파싱 완료");
    }
}
