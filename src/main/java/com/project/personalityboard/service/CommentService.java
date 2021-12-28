package com.project.personalityboard.service;

import java.util.List;

import com.project.personalityboard.dto.CommentDTO;


public interface CommentService {

	List<CommentDTO> findAll(long b_number);

	void save(CommentDTO comment);

	void delete(long c_number);

}
