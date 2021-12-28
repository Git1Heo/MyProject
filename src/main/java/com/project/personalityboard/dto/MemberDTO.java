package com.project.personalityboard.dto;

import lombok.Data;

@Data
public class MemberDTO {
	private long m_number;
	private String m_id; 
	private String m_password;
	private String m_name;
	private String m_mail;
	private String m_phone; 
	private String m_mbti;
	private String m_profile;
	
}
