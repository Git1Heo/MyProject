package com.project.personalityboard.dto;

import lombok.Data;

@Data
public class SearchPageDTO {
	private String type;
	private String word;
	private int start;
	private int limit;
	
	
	public SearchPageDTO(String type, String word, int start, int limit) {
		super();
		this.type = type;
		this.word = word;
		this.start = start;
		this.limit = limit;
	}
	

	
	
	
	
}
