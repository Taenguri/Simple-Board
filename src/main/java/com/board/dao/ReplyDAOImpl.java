package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.vo.ReplyListVO;
import com.board.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{

	@Inject SqlSession sql;

	@Override
	public void registReply(ReplyVO reply) throws Exception {
		sql.insert("replyMapper.registReply",reply);
	}

	@Override
	public List<ReplyListVO> replyList(int bno) throws Exception {
		return sql.selectList("replyMapper.replyList",bno);
	}

	@Override
	public String idCheck(int rno) throws Exception {
		return sql.selectOne("replyMapper.replyMemberIdCheck", rno);
	}

	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		sql.delete("replyMapper.deleteReply",reply);
	}

	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		sql.update("replyMapper.modifyReply", reply);
	}
	
	
}
