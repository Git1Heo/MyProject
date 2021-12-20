package com.project.personalityboard.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.personalityboard.dto.MemberDTO;
import com.project.personalityboard.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberRepository mr;
	
	//회원가입
	@Override
	public void signup(MemberDTO member) {
	mr.signup(member);	
		
	}
	
	// 아이디 중복체크
	@Override
	public String idDuplicate(String m_id) {
		String result=mr.idDuplicate(m_id);
		if (result==null)
			return "ok"; 
		else
			return "no";
	}
	
	//로그인 
	@Override
	public MemberDTO login(MemberDTO member) {
		return mr.login(member);
		
	}
	
	//회원관리
	@Override
	public List<MemberDTO> memberManagement() {
		
		return mr.memberManagement();
	}
	
	//회원 삭제
	@Override
	public void memberDelete(long m_number) {
		mr.memberDelete(m_number);
		
	}

	@Override
	public MemberDTO mypage(String m_id) {
		return mr.mypage(m_id);
		
	}

}
