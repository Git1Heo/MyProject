package com.project.personalityboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.personalityboard.dto.MemberDTO;
import com.project.personalityboard.repository.PersonalityRepository;

@Service
public class PersonalityService {

	@Autowired
	private PersonalityRepository pr;
	
	public void testInsert(MemberDTO member) {
		pr.testInsert(member);
	}

}
