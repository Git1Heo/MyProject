package com.project.personalityboard.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.project.personalityboard.dto.BoardDTO;
import com.project.personalityboard.dto.CommentDTO;
import com.project.personalityboard.dto.MemberDTO;
import com.project.personalityboard.dto.PageDTO;
import com.project.personalityboard.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService bs;
	
	// 게시글 목록 화면이동
	@RequestMapping(value = "/board/allList", method = RequestMethod.GET)
	public String boardAllListeForm(Model model) {
		List <BoardDTO> boardList=bs.allList();
		model.addAttribute("board", boardList);
		return "/board/allList";
	}
	
	// 게시글 상세보기 화면이동
	@RequestMapping(value = "/board/view", method = RequestMethod.GET)
	public String boardView(Model model,@RequestParam ("b_number")long b_number,
										@RequestParam ("m_id")String m_id) {
		BoardDTO board=bs.boardView(b_number);
		model.addAttribute("board", board);
		//댓글 출력
		List <CommentDTO> commentList=bs.commentView(b_number);
		model.addAttribute("commentList", commentList);
		//댓글에 작성자 정보 넘기기
		MemberDTO member=bs.meberInfo(m_id);
		model.addAttribute("member", member);
		return "/board/view";
	}
	
	
	//글쓰기 화면 이동
	@RequestMapping(value = "/board/boardWrite", method = RequestMethod.GET)
	public String boardWriteForm(Model model,@RequestParam ("m_id")String m_id) {
		MemberDTO member=bs.meberInfo(m_id);
		model.addAttribute("member", member);
		return "/board/boardWrite";
	}
	
	//글 작성
	@RequestMapping(value = "/board/boardWrite", method = RequestMethod.POST)
	public String boardWrite(@ModelAttribute BoardDTO board) {
		System.out.println("보드컨트롤러" + board);
		bs.boardWrite(board);
		return "redirect:/board/paging";
	}
	
	// 글 삭제
	@RequestMapping(value = "/board/delete", method = RequestMethod.GET)
	public String boardDelete(@RequestParam ("b_number")long b_number) {
		bs.boardDelete(b_number);
		return "redirect:/board/paging";
	}
	
	// 글 수정 페이지 출력(글 상세보기 메소드 사용)
	@RequestMapping(value = "/board/update", method = RequestMethod.GET)
	public String boardupdateForm(@RequestParam ("b_number")long b_number,Model model,
								  @RequestParam ("m_id")String m_id) {
		BoardDTO board=bs.boardView(b_number);
		model.addAttribute("board", board);
		MemberDTO member=bs.meberInfo(m_id);
		model.addAttribute("member", member);
		return "/board/update";
	}
	
	// 글 수정 처리
	@RequestMapping(value = "/board/update", method = RequestMethod.POST)
	public String boardupdate(@ModelAttribute BoardDTO board) {

		bs.update(board);
		return "redirect:/board/paging";
	}
	
	//썸머노트 파일 저장
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
		
		JsonObject jsonObject = new JsonObject();
		
		String fileRoot = "C:\\summernote_image\\";	//저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject;
	}
	
	
	// 페이징
		@RequestMapping(value="/board/paging", method=RequestMethod.GET)
		public String paging(@RequestParam(value="page", required=false, defaultValue="1")int page, Model model) {			
			List<BoardDTO> board = bs.pagingList(page);  
			PageDTO paging = bs.paging(page);
			model.addAttribute("board", board);
			model.addAttribute("paging", paging);
			return "/board/allList";
		}
		
		//서치 페이징
		@RequestMapping(value="/board/search", method=RequestMethod.GET)
		public String search(@RequestParam ("searchtype") String searchtype,
							 @RequestParam ("keyword") String keyword ,Model model,
							 @RequestParam(value="page", required=false, defaultValue="2")int page,
							 HttpServletRequest request) {
			List <BoardDTO> board=bs.searchPage(searchtype,keyword,page);
			PageDTO paging = bs.searchPaging(page,searchtype,keyword);
			System.out.println("boardController"+ board);
			request.setAttribute("searchtype", searchtype);
			request.setAttribute("keyword", keyword);
			model.addAttribute("board", board);
			model.addAttribute("paging", paging);
			return "/board/allList";
		}

}
