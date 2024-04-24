package com.bark.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.xml.sax.SAXException;

import com.bark.domain.Board;
import com.bark.domain.Criteria;
import com.bark.domain.Page;
import com.bark.domain.Shelter;
import com.bark.mapper.CommentMapper;
import com.bark.service.BoardService;
import com.bark.service.SecurityService;
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
	private BoardService boardservice;
	private SecurityService securityService;
	
	private CommentMapper commentmapper;
	
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
	public void campaign(Model model,
  		   				 @RequestParam(required=false, value="pageNum") Integer pageNum,
  		   				 @RequestParam(required=false, value="amount") Integer amount,
  		   				 HttpSession session) {
		log.info("campaign...........");
		
		Integer type = 3;   				// 캠페인
		log.info("campaign [" + type +"-"+ pageNum + "-" + amount + "]");

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

		log.info("campaign End");
	}
	
 
	@GetMapping("/write")
	public String write(HttpSession session) {
		// 보호소 회원 여부 체크, 회원이 아니면 main으로 
		if(securityService.hasRole(2, session)) {
			return "/donation/write";
		}
		return "main";

	}
	
	@PostMapping("/write")
	public String write(Board board, RedirectAttributes rttr) {
		Integer type = 3;					// 캠페인   
		log.info("write : " + board);
		board.setType(type);				// 캠페인
		boardservice.write(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/donation/campaign";
	}
	
	@GetMapping("/read")//단건
	public void read(Model model, 
					 @RequestParam("bno") Integer  bno,						   
					 @RequestParam(required=false, value="pageNum") Integer pageNum,
					 @RequestParam(required=false, value="amount") Integer amount) {
		
		Integer type = 3;   				// 캠페이
		System.out.println("read [" + bno + "-" + type +"-" + pageNum + "-" + amount + "]");

		// pageNum, amount를 객체에 Set
		Criteria cri = new Criteria();
		
		if (pageNum == null || pageNum == 0) { // 값이 없으면 1 Set
			pageNum = 1; 
		}
		if (amount == null) {			// 값이 없으면 10 Set		
			amount = 12;
		}
		
		cri.setPageNum(pageNum);
		// sql에서 쓰이는 Limit에서는 0 부터 시작 하므로 -1 처리 
		cri.setPageSql((pageNum -1)* 10);
		cri.setAmount(amount);
		cri.setType(type);					// 공지사항 "2"

		// 조회 조건에 따른 전게 건수 
		int total = boardservice.totalPage(cri);
		Page page = new Page(cri, total);
		
		Board board = new Board();
		board = boardservice.read(bno);
		
		// 조회 수(hit) 증가
		boardservice.updateHit(bno);
		
		model.addAttribute("page", page);
		model.addAttribute("board", boardservice.read(bno));
		model.addAttribute("commentCount", commentmapper.getCount(bno));
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("bno") Integer  bno, HttpSession session) {
		if(securityService.hasRole(2, session)) {
			log.info("delete : " + bno);
			boardservice.delete(bno);
			return "redirect:/donation/campaign";
		}
		return "main";
	}
	
	@GetMapping("/upate")
	public String update(HttpSession session) {
		if(securityService.hasRole(2, session)) {
			return "/donation/update";
		}
		return "main";
	}
	
	@GetMapping("/update")
	public String update(Model model, 
						@RequestParam("bno") Integer  bno,
			 			@RequestParam(required=false, value="pageNum") Integer pageNum,
			 			@RequestParam(required=false, value="amount") Integer amount, HttpSession session) {
		log.info("noticeUpdate : " + bno);
		if(securityService.hasRole(2, session)) {
			Integer type = 3;   				
			System.out.println("read [" + bno + "-" + type + "-" + pageNum + "-" + amount + "]");
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("amount", amount);
			model.addAttribute("board", boardservice.read(bno));
			return "/board/noticeUpdate";
		}
		return "main";
	}

}
