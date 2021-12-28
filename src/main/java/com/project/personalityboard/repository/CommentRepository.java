package com.project.personalityboard.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.personalityboard.dto.CommentDTO;

@Repository
public class CommentRepository {
	@Autowired
	private SqlSessionTemplate sql;
	
	public List<CommentDTO> findAll(long b_number) {
		return sql.selectList("Comment.findall", b_number);
	}

	public void save(CommentDTO comment) {
		sql.insert("Comment.save",comment);
		
	}

	public void delete(long c_number) {
		sql.delete("Comment.delete", c_number);
		
	}

}
