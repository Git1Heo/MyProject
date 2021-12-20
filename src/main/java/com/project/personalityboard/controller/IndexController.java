package com.project.personalityboard.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.personalityboard.dto.MemberDTO;
import com.project.personalityboard.service.MemberService;

@Controller
public class IndexController {
	
	@Autowired
	private MemberService ms;
	@Autowired
	private HttpSession session ;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String indexForm() {		
		return "index";	
	}
	
	//회원가입 페이지 이동
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signupForm() {		
		return "signup";	
	}
	
	//회원가입
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(@ModelAttribute MemberDTO member, @RequestParam ("m_com") String m_com)  {		
		member.setM_mail(member.getM_mail()+m_com);
		ms.signup(member);
		return "index";	
	}
	
	//중복체크
	@RequestMapping(value="/idDuplicate", method=RequestMethod.POST)
	public @ResponseBody String idDuplicate(@RequestParam ("id") String m_id) {		
		String result=ms.idDuplicate(m_id);
		return result; 
	}
	
	//로그인 처리
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public  String login(Model model,@ModelAttribute MemberDTO member) {		
		
		MemberDTO result=ms.login(member);
		model.addAttribute("member", result);
		if(result == null)	{
//			String alert="<script>alert('Login Fail');location.href='/'</script>";
//			return alert; 
			loginfail();
			
			return "index";
		}
		else {
			session.setAttribute("loginID", member.getM_id());
			session.setAttribute("loginPW", member.getM_password());
			String alert="<script>alert('Login Success');location.href='/'</script>";
			return "index";
		}
	}
	public String loginfail() {
		String alert="<script>alert('Login Fail');</script>";
		return alert;
	}
	
	
	//로그아웃 처리
	@RequestMapping (value="/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
        session.invalidate();
        return "index";
	}
	
	//운영자 권한 회원 관리(selectlist)
	@RequestMapping(value = "/memberManagement", method = RequestMethod.GET)
	public String memberManagement(Model model) {
		List <MemberDTO> memberList=ms.memberManagement();
		model.addAttribute("member", memberList);
		return "memberManagement";	
	}
	
	//회원 삭제
	@RequestMapping (value="/memberManagement/delete", method=RequestMethod.GET)
	public String memberDelete(@RequestParam ("m_number") long m_number) {
		ms.memberDelete(m_number);
        return "redirect:/memberManagement";
	}
	
	//마이 페이지
	@RequestMapping (value="/mypage", method=RequestMethod.GET)
	public String mypage(@RequestParam ("m_id") String m_id,Model model) {
		MemberDTO member =ms.mypage(m_id);
		model.addAttribute("member", member);
        return "mypage";
	}
	
}
