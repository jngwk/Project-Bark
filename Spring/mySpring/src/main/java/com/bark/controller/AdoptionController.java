package com.bark.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bark.domain.Criteria;
import com.bark.domain.Dog;
import com.bark.domain.Page;
import com.bark.service.AdoptionService;
import com.bark.service.ShelterService;
import com.bark.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/adoption/*")
@AllArgsConstructor
public class AdoptionController {
	private AdoptionService service;
	private UserService 	userservice;
	private ShelterService 	shelterservice;
	
	
	@GetMapping("/list")
	public void list(Model model,
			 @RequestParam(required=false, value="pageNum") Integer pageNum,
			 @RequestParam(required=false, value="amount") Integer amount) {	//입양목록: 강아지 리스트 가져오기
		log.info("list...........");
		
		Integer type = 5;	//입양 게시판
		System.out.println("noticeList type-feild-pageNum-amount : " + type + "-" + pageNum + "-" + amount);
		
		// pageNum, amount를 객체에 Set
		Criteria cri = new Criteria();
		
		if (pageNum == null) {   		// 값이 없으면 0 Set
			pageNum = 1; 
		}
		if (amount == null) {			// 값이 없으면 16 Set		
			amount = 16;
		}

		cri.setPageNum(pageNum);
		// sql에서 쓰이는 Limit에서는 0 부터 시작 하므로 -1 처리 
		cri.setPageSql((pageNum -1)* 10);
		cri.setAmount(amount);
		cri.setType(type);				// 입양게시판 "5"
		
		// 조회 조건에 따른 전게 건수 
		int total = service.getDogList().size();	//172마리
		Page page = new Page(cri, total);
		
		model.addAttribute("page", page);
		model.addAttribute("dogList", service.searchList(cri));
	}
		
	@GetMapping("/detail")
	public String detail(@RequestParam("dogno") int dogno, 
						 @RequestParam("userId") String userId,
						 @RequestParam("shelterno") String shelterno,
						 Model model) {	//입양상세: 강아지 정보
		log.info("detail...........");
		
		
		model.addAttribute("dog", service.getDog(dogno));
		model.addAttribute("user", userservice.getUser(userId));
		model.addAttribute("shelter", shelterservice.getShelter(shelterno));
		return "adoption/detail";
	}
	
	@GetMapping("/write")
	public void dogUploadAjax() {
		log.info("dogUpload ajax");
	}
	
	@PostMapping("/write") // 게시글저장
	public String write(Dog dog, RedirectAttributes rttr) {
		log.info("write :" + dog);
		if (dog.getDogAttachedList() != null) {
			dog.getDogAttachedList().forEach(attach -> log.info(attach));
		}
		service.write(dog);
		rttr.addFlashAttribute("result", dog.getDogno());
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
