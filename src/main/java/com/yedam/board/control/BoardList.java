package com.yedam.board.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.board.service.BoardService;
import com.yedam.board.service.BoardServiceImpl;
import com.yedam.board.vo.Board;
import com.yedam.common.Control;
import com.yedam.common.PageDTO;

public class BoardList implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		int curPage = Integer.parseInt(page);

		BoardService service = new BoardServiceImpl();
		List<Board> list = service.boardList(curPage);

		req.setAttribute("list", list);

		PageDTO dto = new PageDTO(curPage, service.totalCount());
		req.setAttribute("page", dto);

		return "board/boardList.tiles";
	}

}
