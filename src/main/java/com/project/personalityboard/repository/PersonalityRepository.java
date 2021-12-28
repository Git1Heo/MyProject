package com.project.personalityboard.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.personalityboard.dto.MemberDTO;

@Repository
public class PersonalityRepository {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	public void testInsert(MemberDTO member) {
		sql.update("Personality.update", member);
	}

}
