package com.bark.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bark.domain.Adoption;
import com.bark.domain.Criteria;
import com.bark.domain.Dog;
import com.bark.domain.Page;
import com.bark.service.AdoptionService;
import com.bark.service.SecurityService;
import com.bark.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/adoption/*")
@AllArgsConstructor
public class AdoptionController {
	private AdoptionService service;
	private UserService userservice;
	private SecurityService securityService;

	@GetMapping("/adoptionInfo")
	public void adoptionInfo() {
		log.info("adoptionInfo");
	}

	@GetMapping("/list")
	public void list(Model model, @RequestParam(required = false, value = "shelterno") Integer shelterno, // 보호소 조회에서
																											// 넘어올 때 보호소
																											// 번호 가져오기
			@RequestParam(required = false, value = "searchWord") String searchWord,
			@RequestParam(required = false, value = "searchField") String searchField,
			@RequestParam(required = false, value = "pageNum") Integer pageNum,
			@RequestParam(required = false, value = "amount") Integer amount) { // 입양목록: 강아지 리스트 가져오기
		log.info("list...........");

		System.out.println("noticeList type-feild-pageNum-amount : " + pageNum + "-" + amount);

		// pageNum, amount를 객체에 Set
		Criteria cri = new Criteria();

		if (pageNum == null) { // 값이 없으면 0 Set
			pageNum = 1;
		}
		if (amount == null) { // 값이 없으면 16 Set
			amount = 16;
		}
		if (searchField == null || searchField == "") {
			searchField = "";
			searchWord = "";
		}
		if (searchWord == null || searchWord == "") {
			searchField = "";
			searchWord = "";
		}

		// sql에서 쓰이는 Limit에서는 0 부터 시작 하므로 -1 처리
		cri.setPageSql((pageNum - 1) * 10);
		cri.setAmount(amount);
		cri.setSearchField(searchField);
		cri.setSearchWord(searchWord);
		cri.setSearchWordSql("%" + searchWord + "%");
		cri.setPageNum(pageNum);
		// sql에서 쓰이는 Limit에서는 0 부터 시작 하므로 -1 처리
		int total = service.getDogList().size(); // 201마리
		Page page = new Page(cri, total);
		model.addAttribute("page", page);
		
		// 입양 목록 페이지에서 조회
		if (shelterno == null) {
			model.addAttribute("dogList", service.searchList(cri));
		} 
		// 보호소 조회 페이지에서 조회
		else {
			log.info(service.searchListByShelterno(cri, shelterno).size());
			model.addAttribute("dogList", service.searchListByShelterno(cri, shelterno));

		}
	}

	@GetMapping("/detail")
	public String detail(@RequestParam("dogno") int dogno, Model model, HttpSession session) { // 입양상세: 강아지 정보
		log.info("detail...........");

		String id = (String) session.getAttribute("userId");
		// dog, shelter join data 추출
		model.addAttribute("dog", service.getDog(dogno));
		model.addAttribute("user", userservice.getUser(id));
		return "adoption/detail";
	}

	// 입양 상세 -> 입양 신청 등록
	@Transactional
	@PostMapping("/adoptionWrite")
	public String adoptionWrite(@RequestParam(required = false, value = "dogno") Integer dogno,
			@RequestParam(required = false, value = "addr") String addr,
			@RequestParam(required = false, value = "addrDetail") String addrDetail, RedirectAttributes rttr,
			HttpSession session) {
		log.info("adoptionWrite...........");
		String address = null;

		Adoption adoption = new Adoption();
		String id = (String) session.getAttribute("userId");
		adoption.setDogno(dogno);
		adoption.setId(id);
		// adoption.getAdopt_date(null);
		// adoption.getRegDate(null); // default 시스템 일자
		adoption.setState(0); // 0: 입양 신청 1: 입양 완료 2: 입양 거절
		service.adoptionWrite(adoption);

		address = (addr + " " + addrDetail.trim()).trim();
		// 주소가 들어올 경우에만 수정 처리
		if (!address.trim().equals(null) && address.trim() != "") {
			userservice.updateAddr(id, address);
		}

		service.adoptionUpdateDog(dogno, 0); // 0: 입양불가, 1:입양가능
		rttr.addFlashAttribute("result", dogno);
		return "redirect:/user/userDonationList?id=" + id;
	}

	public void dogUploadAjax() {
		log.info("dogUpload ajax");
	}

	@GetMapping("/write")
	public String dogAdd(HttpSession session) {
		log.info("write");
		if (securityService.hasRole(2, session)) {
			return "/adoption/write";
		}
		return "main";
	}

	@PostMapping("/write") // 게시글저장
	public String write(Dog dog, RedirectAttributes rttr) {
		log.info("write :" + dog);
		if (dog.getDogAttachedList() != null) {
			dog.getDogAttachedList().forEach(attach -> log.info(attach));
		}
		service.write(dog);
		rttr.addFlashAttribute("result", dog);
		return "redirect:/adoption/list";
	}

//	@GetMapping(value = "/getAttachList"
//	, produces=MediaType.APPLICATION_JSON_VALUE)
//@ResponseBody 
//public ResponseEntity<List<Attached>> getAttachList(Integer dogno){ 
//log.info("getAttachList "+dogno); 
//return new ResponseEntity<>(service.getAttachList(dogno), HttpStatus.OK); 
//}	
//	@GetMapping("/read")
//	public void read(@RequestParam("dogno") Integer dogno, Model model) {
//		log.info("/read");
//		model.addAttribute("dog", service.read(dogno));
//	}
//
//	@PostMapping("/modify")
//	public String modify(Board board, RedirectAttributes rttr) {
//		log.info("modify : " + board);
//		if (service.modify(board)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		return "redirect:/board/list";
//	}
//
//	@PostMapping("/remove")
//	public String remove(@RequestParam("bno") Integer bno, RedirectAttributes rttr) {
//		log.info("remove.......:" + bno);
//		if (service.remove(bno)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		return "redirect:/board/list";
//	}
}
