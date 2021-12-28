package com.project.personalityboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.personalityboard.dto.CommentDTO;
import com.project.personalityboard.repository.CommentRepository;

@Service
public class CommentServiceImlp implements CommentService{

	@Autowired
	private CommentRepository cr;
	@Override
	public List<CommentDTO> findAll(long b_number) {
		return cr.findAll(b_number);
	}

	@Override
	public void save(CommentDTO comment) {
		cr.save(comment);
		
	}

	@Override
	public void delete(long c_number) {
		cr.delete(c_number);
		
	}

}
