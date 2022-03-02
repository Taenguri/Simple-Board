package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.BoardDAO;
import com.board.vo.BoardVO;
import com.board.vo.PageVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boarddao;

	@Override
	public void write(BoardVO boardVO) throws Exception {
		boarddao.write(boardVO);
		
	}
	@Override
	public BoardVO getArticle(int bno) throws Exception {
		boarddao.boardHit(bno);
		return boarddao.getArticle(bno);
	}
	
	@Override
	public void update(BoardVO boardVO) throws Exception {
		boarddao.update(boardVO);
	}

	@Override
	public void delete(int bno) throws Exception {
		boarddao.delete(bno);
	}
	@Override
	public List<BoardVO> list(com.board.vo.SearchVO search) throws Exception {
		return boarddao.list(search);
	}
	@Override
	public int listCount(com.board.vo.SearchVO search) throws Exception {
		return boarddao.listCount(search);
	}
	
}
