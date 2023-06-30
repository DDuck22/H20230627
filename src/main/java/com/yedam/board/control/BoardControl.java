package com.yedam.board.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.board.service.BoardService;
import com.yedam.board.service.BoardServiceImpl;
import com.yedam.board.vo.Board;
import com.yedam.common.Control;

public class BoardControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String bno = req.getParameter("bno");
		BoardService svc = new BoardServiceImpl();
		Board brd = svc.getBoard(Long.parseLong(bno));

		req.setAttribute("board", brd);

		return "board/board.tiles";
	}

}
