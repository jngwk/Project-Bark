package com.bark.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	//private UserService userService;
	@GetMapping("/form")
	public void form(Model model, 
			 @RequestParam(required=false, value="shelterno") Integer selectedShelterNo) {
		log.info("form ===========");
		log.info(selectedShelterNo);
		
		List<Shelter> sList = service.getShelterList();
		log.info(sList.size());
		model.addAttribute("sList", sList);
		if(selectedShelterNo != null) {
			model.addAttribute("selectedShelterNo", selectedShelterNo);
		}
	}

	/*
	 * @GetMapping("/form") public void form() { log.info("form..........."); }
	 */
	@GetMapping("/map")
    public String getShelterList(Model model) throws ParserConfigurationException, SAXException, IOException, ServletException {
        log.info("-------shelter/info mapping o--------");

        ShelterInfo shelterinfo = new ShelterInfo();
        log.info("-------shelter json--------");
        
        List<Shelter> sqlList = service.getShelterList();
        log.info("-------get sqlshelter list--------");
        
        HashMap<String, Shelter> sMap = shelterinfo.getShelterInfo();		
        if(sqlList.size()<=0) {
	        for(Entry<String, Shelter> entrySet : sMap.entrySet()) {
	        	service.putShelterInfo(entrySet.getValue());
	        }
        }
        log.info("-------insert into HaspMap--------");
        
        List<Shelter> sList = service.getShelterList();
        log.info("-------get shelter list--------");
        
    	model.addAttribute("sList", sList);

        return "/donation/map";

    }
	
	// 보호소 회원가입 설렉트 드롭다운 ajax
	@GetMapping(value = "shelterList", produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Shelter> getShelterListAjax(Model model)
			throws ParserConfigurationException, SAXException, IOException, ServletException {
		log.info("-------shelter/info mapping o--------");

		ShelterInfo shelterinfo = new ShelterInfo();
		log.info("-------shelter json--------");

		List<Shelter> sList = service.getShelterList();
		log.info("-------get sqlshelter list--------");

		HashMap<String, Shelter> sMap = shelterinfo.getShelterInfo();
		if (sList.size() <= 0) {
			for (Entry<String, Shelter> entrySet : sMap.entrySet()) {
				Shelter shelter = entrySet.getValue();
				service.putShelterInfo(shelter);
				sList.add(shelter);
			}
		}
//		List<String> nList = new ArrayList<>();
//		sList.forEach(shelter -> {
//			nList.add(shelter.getShelterName());
//		});
		log.info("-------insert into HaspMap--------");

		return sList;

	}
	
	@GetMapping(value="shelterSearchName",produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Shelter> shelterSearchName(@RequestParam ("name") String name,Model model) {
		log.info("-------sheltername search mapping o--------");
		log.info(name);
		return service.searchShelterName(name);
	}
	
	@GetMapping(value="shelterSearchAddr",produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Shelter> shelterSearchAddr(@RequestParam ("addr") String addr,Model model) {
		log.info("-------shelteraddr search mapping o--------");
		log.info(addr);
		return service.searchShelterAddr(addr);
	}
	
	@GetMapping("/campaign")
	public void campaign() {
		log.info("campaign...........");
	}

}
