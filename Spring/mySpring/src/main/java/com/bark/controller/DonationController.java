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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xml.sax.SAXException;

import com.bark.domain.Shelter;
import com.bark.service.ShelterService;
import com.bark.temp.ShelterInfo;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/donation/*")
@AllArgsConstructor
public class DonationController {
	private ShelterService service;
	
	@GetMapping("/form")
	public void form() {
		log.info("form...........");
	}
	@GetMapping("/map")
    public String getShelterList(Model model) throws ParserConfigurationException, SAXException, IOException, ServletException {
        log.info("-------shelter/info mapping o--------");

        ShelterInfo shelterinfo = new ShelterInfo();
        log.info("-------shelter json--------");
        
        List<Shelter> sList = service.getShelterList();
        log.info("-------get shelter list--------");
        
        HashMap<String, Shelter> sMap = shelterinfo.getShelterInfo();		
        if(sList.size()<=0) {
	        for(Entry<String, Shelter> entrySet : sMap.entrySet()) {
	        	service.putShelterInfo(entrySet.getValue());
	        }
        }
        log.info("-------insert into HaspMap--------");
        
    	model.addAttribute("sList", sList);

        return "/donation/map";

    }
	
	@GetMapping(value="shelterSearchList",produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Shelter> shelterSearchList(@RequestParam ("name") String name,Model model) {
		log.info("-------sheltername search mapping o--------");
		log.info(name);
		return service.searchShelterList(name);
//		model.addAttribute("sList", sList);

	}
	
	
	
}
