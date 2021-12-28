package com.project.personalityboard.service;

import java.util.List;

import com.project.personalityboard.dto.BoardDTO;
import com.project.personalityboard.dto.CommentDTO;
import com.project.personalityboard.dto.MemberDTO;
import com.project.personalityboard.dto.PageDTO;

public interface BoardService {

	void boardWrite(BoardDTO board);

	List<BoardDTO> allList();
	// 게시글 상세
	BoardDTO boardView(long b_number);
	List <CommentDTO> commentView(long b_number);
	MemberDTO meberInfo(String m_id);  // 댓글 작성자 정보
	// 게시글 삭제
	void boardDelete(long b_number);
	// 게시글 수정 처리
	void update(BoardDTO board);
	// 페이징
	PageDTO paging(int page);	
	List<BoardDTO> pagingList(int page);
	// 검색 페이징
	List<BoardDTO> searchPage(String searchtype, String keyword, int page);
	PageDTO searchPaging(int page, String searchtype, String keyword);




	



}
