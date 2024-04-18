package com.bark.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bark.domain.Board;
import com.bark.domain.Criteria;
import com.bark.domain.Page;
import com.bark.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor

public class BoardController {
	private BoardService service;

	@GetMapping("/noticeList")
	public void noticeList(Model model,
						   @RequestParam(required=false, value="searchField") String searchField,
						   @RequestParam(required=false, value="searchWord") String searchWord,
						   @RequestParam(required=false, value="pageNum") Integer pageNum,
						   @RequestParam(required=false, value="amount") Integer amount) {
		Integer type = 2;
		System.out.println("noticeList type-feild-pageNum-amount : " + type +"-"+ searchField + "-" + searchWord +
						"-" + pageNum + "-" + amount);
		
		// pageNum, amount를 객체에 Set
		Criteria cri = new Criteria();
		
		if (pageNum == null) {   		// 값이 없으면 0 Set
			pageNum = 0; 
		}
		if (amount == null) {			// 값이 없으면 10 Set		
			amount = 10;
		}
		if (searchField == null) {
			searchField = null;
		}
		if (searchField == null) {
			searchField = null;
		}

		
		int total = service.totalPage(type, searchField, "%" + searchWord + "%");

		// 화면 page 처리에는 1을 더해 준다., 
		cri.setPageNum(pageNum + 1);
		cri.setAmount(amount);
		Page page = new Page(cri, total);
		
		// sql문에서 사용시에는 Limit 에서 0부터 시작하므로 그대로 대입 후 10을 곱한다.
		cri.setPageNum((pageNum)* 10) ;
		
		model.addAttribute("bList", service.searchList(cri, type, searchField, "%" + searchWord + "%"));
		model.addAttribute("page", page);
	}	
	
	// 게시판별(type) 검색 단어(searchWord)가 있을 때 page별 조회  
	@GetMapping("/searchlist")
	public void searchList(Model model,
						    @RequestParam("type") Integer type,
							@RequestParam("pageNum") Integer pageNum,
							@RequestParam("amount") Integer amount,
							@RequestParam("searchField") String searchField,
							@RequestParam("searchWord") String searchWord) {

		log.info("searchlist");
		
		// pageNum, amount를 객체에 Set
		Criteria cri = new Criteria();
		cri.setPageNum(pageNum);
		cri.setAmount(amount);
		if (pageNum == 0) {   		// 값이 없으면 0 Set
			cri.setPageNum(0); 
		}
		if (amount == 0) {			// 값이 없으면 10 Set		
			cri.setAmount(10);
		}
		if (searchField == null) {  // 값이 없으면 title Set
			searchField = ""; 
		}
		if (searchWord == null) {	// 값이 없으면 space Set		
			searchField = "";    		
		}

		int total = service.totalPage(type, searchField, "%" + searchWord + "%");
		// 화면 page 처리
		Page page = new Page(cri, total);

		model.addAttribute("bList", service.searchList(cri, type, searchField, "%" + searchWord + "%"));
		model.addAttribute("page", page);
	}
	
//	@GetMapping("/read")
//	public void read(Model model, 
//		    		 @RequestParam("type") Integer type,
//		    		 @RequestParam("pageNum") Integer pageNum,
//		    		 @RequestParam("amount") Integer amount,
//					 @RequestParam("bno") Integer bno) {
//		log.info("/read");
//		
//		// pageNum, amount를 객체에 Set
//		Criteria cri = new Criteria();
//		cri.setPageNum(pageNum);
//		cri.setAmount(amount);
//		if (pageNum == 0) {   		// 값이 없으면 0 Set
//			cri.setPageNum(0); 
//		}
//		if (amount == 0) {			// 값이 없으면 10 Set		
//			cri.setAmount(10);
//		}
//
//		//int total = service.totalPage(type);
//		// 화면 page 처리
//		//Page page = new Page(cri, total);
//		
//		model.addAttribute("board", service.read(bno));
//		//model.addAttribute("page", page);
//
//	}
	
	@PostMapping("/write")
	public String write(Board board, RedirectAttributes rttr) {
		
		log.info("write : " + board);

		service.write(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";
	}
	
//	@PostMapping("/update")
//	public String update(Board board, RedirectAttributes rttr) {
//		
//		log.info("update : " + board);
//
//		service.update(board);
//		rttr.addFlashAttribute("result", board.getBno());
//		return "redirect:/board/list";
//	}

	@PostMapping("/delete")
	public String delete(Board board, RedirectAttributes rttr) {
		
		log.info("delete : " + board);

		service.delete(board.getBno());
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";
	}
}
