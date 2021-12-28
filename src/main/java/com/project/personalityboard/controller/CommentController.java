package com.project.personalityboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.personalityboard.dto.CommentDTO;
import com.project.personalityboard.service.CommentService;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService cs;
	
	
	@RequestMapping (value ="/board/comment/save", method=RequestMethod.POST)
	public  @ResponseBody List<CommentDTO> save (@ModelAttribute CommentDTO comment){
		/* System.out.println("commentController.save() : " + comment); */
		cs.save(comment);
		
		List<CommentDTO> commentList = cs.findAll(comment.getB_number());
		return commentList;
		}
	
	// 댓글 삭제
	@RequestMapping (value ="/board/comment/delete", method=RequestMethod.GET)
	public  String CommentDelete (@RequestParam ("c_number") long c_number,
								  @RequestParam ("b_number") long b_number,
								  @RequestParam ("m_id") String m_id){

		cs.delete(c_number);
		return "redirect:/board/view?b_number=" + b_number + "&m_id="+m_id;
		}
}
