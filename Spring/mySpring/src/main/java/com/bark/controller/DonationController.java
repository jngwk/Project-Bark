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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xml.sax.SAXException;

import com.bark.domain.Criteria;
import com.bark.domain.Page;
import com.bark.domain.Shelter;
import com.bark.service.BoardService;
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
	private BoardService boardservice;
	
	@GetMapping("/form")
	public void form(Model model, 
			 @RequestParam(required=false, value="shelterno") Integer selectedShelterno) {
		log.info("form ===========");
		log.info(selectedShelterno);
		
		List<Shelter> sList = service.getShelterList();
		log.info(sList.size());
		model.addAttribute("sList", sList);
		if(selectedShelterno != null) {
			model.addAttribute("selectedShelterno", selectedShelterno);
		}
	}
	
	@GetMapping("/formComplete")
	public String formComplete(Model model) {
		return "/donation/formComplete";
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
	
	//보호소 이름으로 검색
	@GetMapping(value="shelterSearchName",produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Shelter> shelterSearchName(@RequestParam ("name") String name,Model model) {
		log.info("-------sheltername search mapping o--------");
		log.info(name);
		return service.searchShelterName(name);
	}
	//보호소 주소로 검색
	@GetMapping(value="shelterSearchAddr",produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Shelter> shelterSearchAddr(@RequestParam ("addr") String addr,Model model) {
		log.info("-------shelteraddr search mapping o--------");
		log.info(addr);
		return service.searchShelterAddr(addr);
	}
	
	// board 테이블에서 캠페인(type=3) 리스트를 가져온다.
	@GetMapping("/campaign")
	public void campaignAjax(Model model,
  		   				 @RequestParam(required=false, value="pageNum") Integer pageNum,
  		   				 @RequestParam(required=false, value="amount") Integer amount) {
		log.info("campaign...........");
		
		Integer type = 3;   				// 캠페인
		System.out.println("noticeList [" + type +"-"+ pageNum + "-" + amount + "]");

		// pageNum, amount를 객체에 Set
		Criteria cri = new Criteria();
		
		if (pageNum == null || pageNum == 0) { // 값이 없으면 0 Set
			pageNum = 1; 
		}
		if (amount == null) {			// 값이 없으면 12 Set		
			amount = 12;
		}

		cri.setPageNum(pageNum);
		// sql에서 쓰이는 Limit에서는 0 부터 시작 하므로 -1 처리 
		cri.setPageSql((pageNum -1)* 10);
		cri.setAmount(amount);
		cri.setType(type);					// 3: 캠페인

		// 조회 조건에 따른 전게 건수 
		int total = boardservice.totalPage(cri);
		Page page = new Page(cri, total);
		
		model.addAttribute("page", page);
		model.addAttribute("bList", boardservice.searchList(cri));

		
	}

}
