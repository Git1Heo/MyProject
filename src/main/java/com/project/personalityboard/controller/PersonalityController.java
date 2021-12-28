package com.project.personalityboard.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.personalityboard.dto.MemberDTO;
import com.project.personalityboard.service.PersonalityService;


@Controller
public class PersonalityController {
	
	@Autowired
	private PersonalityService ps;
	
	//유형검사 페이지 이동
	@RequestMapping(value = "/personality/check", method = RequestMethod.GET)
	public String personalityCheckForm() {		
		return "/personality/check";	
	}
	
	//테스트 완료
	
	@RequestMapping(value = "/personality/checkEnd", method = RequestMethod.GET)
	public String personalityCheckEndForm(@RequestParam ("checkValue") int checkValue,HttpServletRequest request, Model model) {		
		System.out.println("검사 컨트롤러" +checkValue);
		model.addAttribute("value", checkValue);
		request.setAttribute("value",checkValue);  
		return "/personality/checkEnd";	
	}
	
	//테스트 결과 저장하고 인덱스로
	@RequestMapping(value = "/personality/checkEnd", method = RequestMethod.POST)
	public String personalityCheckEnd(@ModelAttribute MemberDTO member) {		
		if(member.getM_id()==null)
			return "/index";
		else {
			ps.testInsert(member);
			return "/index";
		}
			
	}
	
	
	
}
