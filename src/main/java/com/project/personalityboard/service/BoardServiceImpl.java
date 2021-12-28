package com.project.personalityboard.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.personalityboard.dto.BoardDTO;
import com.project.personalityboard.dto.CommentDTO;
import com.project.personalityboard.dto.MemberDTO;
import com.project.personalityboard.dto.PageDTO;
import com.project.personalityboard.dto.SearchPageDTO;
import com.project.personalityboard.repository.BoardRepository;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardRepository br;
	
	@Override
	public void boardWrite(BoardDTO board) {
		br.boardWrite(board);
		
	}

	@Override
	public List<BoardDTO> allList() {
		return br.allList();
	}
	
	// 게시글 상세보기
	@Override
	public BoardDTO boardView(long b_number) {
		return br.boardView(b_number);
	}
	
	@Override
	public List <CommentDTO> commentView(long b_number) {		
		return br.commentView(b_number);
	}
	
	// 댓글작성자 정보
	@Override
	public MemberDTO meberInfo(String m_id) {
		return br.memberInfo(m_id);
	}


	
	// 게시글 삭제
	@Override
	public void boardDelete(long b_number) {
		br.boardDelete(b_number);
	}
	
	//게시글 수정 처리
	@Override
	public void update(BoardDTO board) {
		br.update(board);
	}
		
	// 페이징
	private static final int PAGE_LIMIT = 15; // 한페이지에 보여질 글 개수 
	private static final int BLOCK_LIMIT = 15; // 한화면에 보여질 페이지 개수

			@Override
			public List<BoardDTO> pagingList(int page) {
				int pagingStart = (page-1) * PAGE_LIMIT;
				Map<String, Integer> pagingParam = new HashMap<String, Integer>();
				pagingParam.put("start", pagingStart);
				pagingParam.put("limit", PAGE_LIMIT);
				List<BoardDTO> pagingList = br.pagingList1(pagingParam);
				/*
				 * for(BoardDTO b: pagingList) { System.out.println(b.toString()); }
				 */
				return pagingList;
			}


		@Override
		public PageDTO paging(int page) {
			int boardCount = br.boardCount(); // 전체 글 갯수 조회
			int maxPage = (int)(Math.ceil((double)boardCount / PAGE_LIMIT)); //전체 페이지 계산
			int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1; //3개씩 보여줄때 기준 1,4,7
			int endPage = startPage + BLOCK_LIMIT - 1; // 3개씩 보여줄때 기준 3,6,9
			if(endPage > maxPage)
				endPage = maxPage; 
			PageDTO paging = new PageDTO();
			paging.setPage(page);
			paging.setStartPage(startPage);
			paging.setEndPage(endPage);
			paging.setMaxPage(maxPage);
			
			//System.out.println("paging.toString(): "+ paging.toString());
			
			return paging;
		}
			

//		private static final int PAGE_LIMIT = 15; // 한페이지에 보여질 글 개수 
//		private static final int BLOCK_LIMIT = 5; // 한화면에 보여질 페이지 개수
		
		// 검색결과 페이징
		@Override
		public List<BoardDTO> searchPage(String searchtype, String keyword, int page) {
			
			int pagingStart = (page-1) * BLOCK_LIMIT;

			SearchPageDTO sp=new SearchPageDTO(searchtype,keyword,pagingStart,BLOCK_LIMIT);
			List<BoardDTO> SearchPaingList=br.SearchPaing(sp);
			 
			return SearchPaingList;				
			}

		@Override
		public PageDTO searchPaging(int page, String searchtype, String keyword) {
			Map<String,String> SearchPagingParam=new HashMap<String,String>();
			SearchPagingParam.put("type", searchtype);
			SearchPagingParam.put("word", keyword);
			
			int boardCount = br.SearchPaingCount(SearchPagingParam); // 전체 글 갯수 조회
			int maxPage = (int)(Math.ceil((double)boardCount / PAGE_LIMIT)); //전체 페이지 계산
			int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1; //3개씩 보여줄때 기준 1,4,7
			int endPage = startPage + BLOCK_LIMIT - 1; // 3개씩 보여줄때 기준 3,6,9
			if(endPage > maxPage)
				endPage = maxPage; 
			PageDTO paging = new PageDTO();
			paging.setPage(page);
			paging.setStartPage(startPage);
			paging.setEndPage(endPage);
			paging.setMaxPage(maxPage);
			System.out.println("검색결과 개수 : "+boardCount);
			System.out.println("paging.toString(): "+ paging.toString());
			
			return paging;
		}



		

			

}
