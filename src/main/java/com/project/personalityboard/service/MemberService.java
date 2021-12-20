package com.project.personalityboard.service;

import java.util.List;

import com.project.personalityboard.dto.MemberDTO;

public interface MemberService {

	void signup(MemberDTO member) ;

	String idDuplicate(String m_id);

	MemberDTO login(MemberDTO member);

	List<MemberDTO> memberManagement();

	void memberDelete(long m_number);

	MemberDTO mypage(String m_id);

}
