package com.yedam.board.service;

import java.util.List;

import com.yedam.board.vo.Board;

public interface BoardService {

	public List<Board> boardList(int page);
	public int totalCount();
	public Board getBoard(long brdNo);
	public boolean clickCnt(long brdNo);

}
