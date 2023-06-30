package com.yedam.board.dao;

import java.util.List;

import com.yedam.board.vo.Board;

public interface BoardMapper {

	public List<Board> selectList(int page);
	public int selectCount();
	public Board selectOne(long brdNo);
	public int clickCount(long brdNo);

}
