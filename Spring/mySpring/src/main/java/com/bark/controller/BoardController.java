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
import com.bark.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor

public class BoardController {
	private BoardService service;
	
	private UserService userservice;

	@GetMapping("/noticeList")
	public void noticeList(Model model,
						   @RequestParam(required=false, value="searchField") String searchField,
						   @RequestParam(required=false, value="searchWord") String searchWord,
						   @RequestParam(required=false, value="pageNum") Integer pageNum,
						   @RequestParam(required=false, value="amount") Integer amount) {

		Integer type = 2;   				// 공지사항
		System.out.println("noticeList [" + type +"-"+ searchField + "-" + searchWord + "-" + pageNum + "-" + amount + "]");

		// pageNum, amount를 객체에 Set
		Criteria cri = new Criteria();
		
		if (pageNum == null || pageNum == 0) { // 값이 없으면 0 Set
			pageNum = 1; 
		}
		if (amount == null) {			// 값이 없으면 10 Set		
			amount = 10;
		}
		if (searchField == null) {
			searchField = "";
		}
		if (searchWord == null) {
			searchWord = "";
		}

		cri.setPageNum(pageNum);
		// sql에서 쓰이는 Limit에서는 0 부터 시작 하므로 -1 처리 
		cri.setPageSql((pageNum -1)* 10);
		cri.setAmount(amount);
		cri.setType(type);					// 공지사항 "2"
		cri.setSearchField(searchField);
		cri.setSearchWord(searchWord);
		cri.setSearchWordSql("%" + searchWord + "%"); 

		// 조회 조건에 따른 전게 건수 
		int total = service.totalPage(cri);
		Page page = new Page(cri, total);
		
		model.addAttribute("page", page);
		model.addAttribute("bList", service.searchList(cri));
	}	
	
	@GetMapping("/read")
	public void read(Model model, 
					 @RequestParam("bno") Integer  bno,						   
					 @RequestParam(required=false, value="searchField") String searchField,
					 @RequestParam(required=false, value="searchWord") String searchWord,
					 @RequestParam(required=false, value="pageNum") Integer pageNum,
					 @RequestParam(required=false, value="amount") Integer amount) {
		
		Integer type = 2;   				// 공지사항
		System.out.println("read [" + bno + "-" + type +"-"+ searchField + "-" + searchWord +"-" + pageNum + "-" + amount + "]");

		// pageNum, amount를 객체에 Set
		Criteria cri = new Criteria();
		
		if (pageNum == null || pageNum == 0) { // 값이 없으면 0 Set
			pageNum = 1; 
		}
		if (amount == null) {			// 값이 없으면 10 Set		
			amount = 10;
		}
		if (searchField == null) {
			searchField = "";
		}
		if (searchWord == null) {
			searchWord = "";
		}
		
		cri.setPageNum(pageNum);
		// sql에서 쓰이는 Limit에서는 0 부터 시작 하므로 -1 처리 
		cri.setPageSql((pageNum -1)* 10);
		cri.setAmount(amount);
		cri.setType(type);					// 공지사항 "2"
		cri.setSearchField(searchField);
		cri.setSearchWord(searchWord);
		cri.setSearchWordSql("%" + searchWord + "%"); 

		// 조회 조건에 따른 전게 건수 
		int total = service.totalPage(cri);
		Page page = new Page(cri, total);
		
		Board board = new Board();
		board = service.read(bno);
		
		model.addAttribute("page", page);
		model.addAttribute("board", service.read(bno));
		model.addAttribute("user", userservice.getUser(board.getId()));
	}
	
	@GetMapping("/read3")
	public void aread(Model model, 
			 @RequestParam("bno") Integer  bno,						   
			 @RequestParam(required=false, value="searchField") String searchField,
			 @RequestParam(required=false, value="searchWord") String searchWord,
			 @RequestParam(required=false, value="pageNum") Integer pageNum,
			 @RequestParam(required=false, value="amount") Integer amount) {
		return ;
	}

	@GetMapping("/shareList")
	public void shareList(Model model,
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
			searchField = "";
		}
		if (searchWord == null) {
			searchWord = "";
		}

		cri.setPageNum(pageNum);
		// sql에서 쓰이는 Limit에서는 0 부터 시작 하므로 -1 처리 
		cri.setPageSql((pageNum -1)* 10);
		cri.setAmount(amount);
		cri.setType(type);					// 공지사항 "2"
		cri.setSearchField(searchField);
		cri.setSearchWord(searchWord);
		cri.setSearchWordSql("%" + searchWord + "%"); 

		// 조회 조건에 따른 전게 건수 
		int total = service.totalPage(cri);
		Page page = new Page(cri, total);
		
		model.addAttribute("bList", service.searchList(cri));
		model.addAttribute("page", page);
	}	
	
	@GetMapping("/contactWrite")
	public void contactWrite() {
		
	}
	
	@GetMapping("/shareWrite")
	public void shareWrite() {
		
	}	
	
	@PostMapping("/write")
	public String write(Board board, RedirectAttributes rttr) {
		
		log.info("write : " + board);

		service.write(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";
	}
	
	@PostMapping("/update")
	public String update(Board board, RedirectAttributes rttr) {
		
		log.info("update : " + board);

		service.update(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";
	}

	@PostMapping("/delete")
	public String delete(Board board, RedirectAttributes rttr) {
		
		log.info("delete : " + board);

		service.delete(board.getBno());
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";
	}
}
