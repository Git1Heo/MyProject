package com.project.personalityboard.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.personalityboard.dto.MemberDTO;

@Repository
public class MemberRepository {
	@Autowired
	private SqlSessionTemplate sql;

	public void signup(MemberDTO member) {
		sql.insert("Member.signup", member);
		
	}

	public String idDuplicate(String m_id) {
		return sql.selectOne("Member.idDuplicate",m_id);
	}

	public MemberDTO login(MemberDTO member) {
		return sql.selectOne("Member.login", member);
		
	}

	public List<MemberDTO> memberManagement() {
		return sql.selectList("Member.memberManagement");
	}

	public void memberDelete(long m_number) {
		sql.delete("Member.memberDelete", m_number);
		
	}

	public MemberDTO mypage(String m_id) {
		return sql.selectOne("Member.mypage", m_id);
		
	}
	
	
}
