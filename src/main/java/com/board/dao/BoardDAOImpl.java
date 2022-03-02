package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.vo.BoardVO;
import com.board.vo.PageVO;
import com.board.vo.SearchVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Inject
	private SqlSession sql;

	@Override
	public void write(BoardVO boardVO) throws Exception {
		sql.insert("boardMapper.insert", boardVO);
		
	}
	@Override
	public BoardVO getArticle(int bno) throws Exception {
		return sql.selectOne("boardMapper.getArticle", bno);
	}
	
	// 게시물 수정
	@Override
	public void update(BoardVO boardVO) throws Exception {
		
		sql.update("boardMapper.update", boardVO);
	}

	// 게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		
		sql.delete("boardMapper.delete", bno);
	}
	@Override
	public List<BoardVO> list(SearchVO search) throws Exception {
		return sql.selectList("boardMapper.list", search);
	}


	@Override
	public int listCount(SearchVO search) throws Exception {
		return sql.selectOne("boardMapper.listCount",search);
	}
	@Override
	public void boardHit(int bno) throws Exception {
		sql.update("boardMapper.boardHit" ,bno);
	}
	
}
