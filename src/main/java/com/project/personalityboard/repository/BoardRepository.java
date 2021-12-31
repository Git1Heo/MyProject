package com.project.personalityboard.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.personalityboard.dto.BoardDTO;
import com.project.personalityboard.dto.CommentDTO;
import com.project.personalityboard.dto.MemberDTO;
import com.project.personalityboard.dto.SearchPageDTO;

@Repository
public class BoardRepository {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	// 게시글 작성 
	public void boardWrite(BoardDTO board) {
		sql.insert("Board.write", board);
		
	}
	
	//게시글 목록
	public List<BoardDTO> allList() {
		return sql.selectList("Board.allList");
	}
	
	// 게시글 상세
	public BoardDTO boardView(long b_number) {
		sql.update("Board.viewAdd",b_number);
		return sql.selectOne("Board.boardView", b_number);
	}
	
	public List <CommentDTO> commentView(long b_number) {
		return sql.selectList("Board.commentView", b_number);
	}
	
	public MemberDTO memberInfo(String m_id) {
		System.out.println("리파지토리" + m_id);
		return sql.selectOne("Board.memberInfo", m_id);
	}
	
	// 게시글 삭제
	public void boardDelete(long b_number) {
		sql.delete("Board.boardDelete", b_number);
	}
	
	// 페이징
	public int boardCount() {
		return sql.selectOne("Board.count");
	}

	public List<BoardDTO> pagingList1(Map<String, Integer> pagingParam) {
		return sql.selectList("Board.pagingList1", pagingParam);
	}

	// 검색 페이징
	public List<BoardDTO> SearchPaing(SearchPageDTO SearchPagingParame) {
		return sql.selectList("Board.Pagingsearch",SearchPagingParame);
	}

	public int SearchPaingCount(Map<String, String> SearchPagingParam) {
		return sql.selectOne("Board.SearchPaingCount",SearchPagingParam);
	}

	public void update(BoardDTO board) {
		System.out.println("수정 리파지토리 : " + board);
		sql.update("Board.update", board);
	}







}
