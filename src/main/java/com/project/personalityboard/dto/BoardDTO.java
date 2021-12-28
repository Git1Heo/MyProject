package com.project.personalityboard.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardDTO {
	private long b_number;
	private String b_title;
	private String b_writer;
	private String b_contents;
	private long b_hits;
	private Timestamp b_date;
	private String b_mbti;
	private String b_profile;
}
