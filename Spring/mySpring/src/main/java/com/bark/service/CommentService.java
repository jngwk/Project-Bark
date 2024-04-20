package com.bark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bark.domain.Comment;
import com.bark.mapper.CommentMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CommentService {
	@Setter(onMethod_ =@Autowired)
	private CommentMapper mapper;
	
	public int insert(Comment comment) { 
		log.info("register ...." + comment);
		return mapper.insert(comment);
	}
	
	public Comment read(Integer commentNo) { 
		log.info("get ...." + commentNo);
		return mapper.read(commentNo);
	}
	
	public int update(Comment comment) { 
		log.info("modify ...." + comment);
		return mapper.update(comment);
	}
	
	public int delete(Integer commentNo) { 
		log.info("remove ...." + commentNo);
		return mapper.delete(commentNo);
	}
	
	public List<Comment> list(Integer bno) { 
		log.info("getComment List of a Board ...." + bno);
		return mapper.List(bno);
	}
}