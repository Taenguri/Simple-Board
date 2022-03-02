package com.board.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.MemberDAO;
import com.board.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	
	@Inject
	MemberDAO memberdao;

	@Override
	public void register(MemberVO member) throws Exception{
		memberdao.register(member);
	}
	
	@Override
	public int idCheck(String memberId) throws Exception {
		
		return memberdao.idCheck(memberId);
	}

	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {
		return memberdao.memberLogin(member);
	}

	@Override
	public void memberDelete(MemberVO member) throws Exception {
		memberdao.memberDelete(member);
	}
	
	
}
