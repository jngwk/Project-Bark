package com.bark.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bark.domain.Dog;
import com.bark.service.DogService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/dog/*")
@AllArgsConstructor
public class DogController {
	private DogService service;
	
	@GetMapping("/write")
	public void dogUploadAjax() {
		log.info("dogUpload ajax");
	}

	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("dList", service.getList());
	}

//	@GetMapping(value = "/getAttachList"
//			, produces=MediaType.APPLICATION_JSON_VALUE)
//	@ResponseBody 
//	public ResponseEntity<List<Attached>> getAttachList(Integer dogno){ 
//		log.info("getAttachList "+dogno); 
//		return new ResponseEntity<>(service.getAttachList(dogno), HttpStatus.OK); 
//	}
	
	
	@PostMapping("/write") // 게시글저장
	public String write(Dog dog, RedirectAttributes rttr) {
		log.info("write :" + dog);
		if (dog.getAttachList() != null) {
			dog.getAttachList().forEach(attach -> log.info(attach));
		}
		service.write(dog);
		rttr.addFlashAttribute("result", dog.getDogno());
		return "redirect:/dog/list";
	}

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