package com.board.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.vo.MemberVO;


@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject SqlSession sql;

	@Override
	public void register(MemberVO member) throws Exception {
		sql.insert("memberMapper.register", member);
	}

	@Override
	public int idCheck(String memberId) throws Exception {
		return sql.selectOne("memberMapper.idCheck",memberId);
	}
	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {
		return sql.selectOne("memberMapper.memberLogin", member);
	}

	@Override
	public void memberDelete(MemberVO member) throws Exception {
		sql.delete("memberMapper.memberDelete",member);
	}
	
	
}
