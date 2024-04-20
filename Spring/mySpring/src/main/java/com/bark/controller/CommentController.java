package com.bark.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.bark.domain.Comment;
import com.bark.service.CommentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/comment")
@RestController
@Log4j
@AllArgsConstructor
public class CommentController {
	private CommentService service;
	
	@PostMapping(value="/new", consumes="application/json",produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody Comment comment) {
		log.info("Comment : " + comment);
		int insertCount = service.insert(comment);
		log.info("Comment INSERT COUNT : " + insertCount);
		return insertCount == 1 ? new ResponseEntity<>("Success", HttpStatus.OK)
				                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/pages/{bno}/{page}", produces= {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Comment>> getList(@PathVariable("page") int page, @PathVariable("bno") Integer bno) {
		log.info("Comment getList..........");
		return new ResponseEntity<>(service.list(bno), HttpStatus.OK);
	}
	
	@GetMapping(value="/{commentNo}",
			produces= {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<Comment> get(@PathVariable("commentNo") Integer commentNo) {
		log.info("get:" + commentNo);
		return new ResponseEntity<>(service.read(commentNo), HttpStatus.OK);
	}
	
	@DeleteMapping(value="/{commentNo}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("commentNo") Integer commentNo) {
		log.info("remove : " + commentNo);
		return service.delete(commentNo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
											  : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
//	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},
//			value="/{commentNo}", consumes="application/json",
//			produces= {MediaType.TEXT_PLAIN_VALUE})
//	public ResponseEntity<String> modify(@RequestBody Comment comment, @PathVariable("commentNo") Integer commentNo) {
//		comment.setRno(commentNo); 
//		log.info("commentNo : " + commentNo);
//		log.info("modify : " + comment);
//		return service.update(comment) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
//				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); 
//	}
	
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH}, value="/{commentNo}", consumes="application/json",
					produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String>modify(@RequestBody Comment comment, @PathVariable("commentNo")Integer commentNo){
	   comment.setCommentNo(commentNo); log.info("commentNo: "+commentNo);   log.info("modify : "+comment);
	   return service.update(comment) ==1 ? new ResponseEntity<>("success", HttpStatus.OK)
			   							  : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
