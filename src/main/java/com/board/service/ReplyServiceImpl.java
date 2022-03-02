package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.ReplyDAO;
import com.board.vo.ReplyListVO;
import com.board.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Inject ReplyDAO dao;

	@Override
	public void registReply(ReplyVO reply) throws Exception {
		dao.registReply(reply);
	}

	@Override
	public List<ReplyListVO> replyList(int bno) throws Exception {
		return dao.replyList(bno);
	}

	@Override
	public String idCheck(int rno) throws Exception {
		return dao.idCheck(rno);
	}

	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		dao.deleteReply(reply);
	}

	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		dao.modifyReply(reply);
	}

	
}
