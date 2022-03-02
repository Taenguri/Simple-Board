package com.board.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.service.BoardService;
import com.board.service.ReplyService;
import com.board.vo.BoardVO;
import com.board.vo.MemberVO;
import com.board.vo.PageCreator;
import com.board.vo.ReplyListVO;
import com.board.vo.ReplyVO;
import com.board.vo.SearchVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	
	@Inject
	BoardService boardservice;	
	
	@Inject
	ReplyService replyservice;
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void write() throws Exception{
	
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardVO boardVO,RedirectAttributes ra) throws Exception{
		
		boardservice.write(boardVO);
        ra.addFlashAttribute("msg", "registerbno");  
		return "redirect:/board/list";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, SearchVO search) throws Exception{
		
		
		
		PageCreator pc = new PageCreator();
		pc.setPaging(search);
		pc.setTotalCount(boardservice.listCount(search));
		
		List<BoardVO> list = boardservice.list(search);
		
		model.addAttribute("pc", pc);
		model.addAttribute("list", list);
		
		return "board/list";
		
	}

	
	// 게시판 수정뷰
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void updateView(BoardVO boardVO, Model model, @ModelAttribute("search") SearchVO search) throws Exception{
		
		model.addAttribute("update", boardservice.getArticle(boardVO.getBno()));
		
	}
	
	// 게시판 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardVO boardVO, RedirectAttributes ra, @ModelAttribute("search") SearchVO search,@RequestParam("bno") int bno) throws Exception{
		
		boardservice.update(boardVO);
		ra.addAttribute("bno", bno);
		ra.addAttribute("page", search.getPage());
		ra.addAttribute("countPerPage", search.getCountPerPage());
		ra.addAttribute("condition", search.getCondition());
		ra.addAttribute("keyword", search.getKeyword());
        ra.addFlashAttribute("msg", "modifybno");  		
		return "redirect:/board/content";
	}

	// 게시판 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(BoardVO boardVO, RedirectAttributes ra, @ModelAttribute("search") SearchVO search) throws Exception{
		
		boardservice.delete(boardVO.getBno());

		ra.addAttribute("page", search.getPage());
		ra.addAttribute("countPerPage", search.getCountPerPage());
		ra.addAttribute("condition", search.getCondition());
		ra.addAttribute("keyword", search.getKeyword());
        ra.addFlashAttribute("msg", "deletebno");  	
		return "redirect:/board/list";
	}


	
	// 게시판 조회
	@RequestMapping(value = "/content", method = RequestMethod.GET)
	public void read(BoardVO boardVO, Model model, @ModelAttribute("search") SearchVO search, @RequestParam("bno") int bno) throws Exception{
		
		model.addAttribute("listContent", boardservice.getArticle(boardVO.getBno()));
		
		
	}		
	

	// 댓글 목록
	@ResponseBody
	@RequestMapping(value = "/content/replyList", method = RequestMethod.GET)
	public List<ReplyListVO> getReplyList(@RequestParam("bno") int bno) throws Exception {
	   
	 List<ReplyListVO> reply = replyservice.replyList(bno);
	 
	 return reply;
	} 
	// 댓글 작성
	@ResponseBody
	@RequestMapping(value = "/content/registReply", method = RequestMethod.POST)
	public void registReply(ReplyVO reply,HttpSession session) throws Exception {
		 MemberVO member = (MemberVO)session.getAttribute("member");
		 reply.setMemberId(member.getMemberId());
	 replyservice.registReply(reply);
	} 
	// 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/content/deleteReply", method = RequestMethod.POST)
	public int getReplyList(ReplyVO reply,  HttpSession session) throws Exception {

	 int result = 0;  
	 MemberVO member = (MemberVO)session.getAttribute("member");
	 String inputId = replyservice.idCheck(reply.getRno());

	 if(member.getMemberId().equals(inputId)) {
	  
	  reply.setMemberId(member.getMemberId());
	  replyservice.deleteReply(reply);
	  
	  result = 1;
	 }
	 
	 return result; 
	
	
	
	}
	
	
	// 댓글 수정
	@ResponseBody
	@RequestMapping(value = "/content/modifyReply", method = RequestMethod.POST)
	public int modifyReply(ReplyVO reply, HttpSession session) throws Exception {
	 int result = 0;
	 
	 MemberVO member = (MemberVO)session.getAttribute("member");
	 String inputId = replyservice.idCheck(reply.getRno());
	 
	 if(member.getMemberId().equals(inputId)) {
	  
	  reply.setMemberId(member.getMemberId());
	  replyservice.modifyReply(reply);
	  result = 1;
	 }
	 
	 return result;
	} 
	
	
}
