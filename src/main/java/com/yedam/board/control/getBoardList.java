package com.yedam.board.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.board.service.BoardService;
import com.yedam.board.service.BoardServiceImpl;
import com.yedam.board.vo.BoardVO;
import com.yedam.common.Control;

public class getBoardList implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		BoardService service = new BoardServiceImpl();
		
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		
		List<BoardVO> list = service.boardList(Integer.parseInt(page));
		
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(list)+".json";
	}

}
