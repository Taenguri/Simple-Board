package com.board.service;

import java.util.List;

import com.board.vo.ReplyListVO;
import com.board.vo.ReplyVO;

public interface ReplyService {
	// 댓글 작성
	public void registReply(ReplyVO reply) throws Exception;

	//댓글 목록
	public List<ReplyListVO> replyList(int bno) throws Exception;
	// 댓글아이디체크
	public String idCheck(int rno) throws Exception;
	// 댓글 삭제
	public void deleteReply(ReplyVO reply) throws Exception;
	//댓글 수정
	public void modifyReply(ReplyVO reply) throws Exception;
	

}
