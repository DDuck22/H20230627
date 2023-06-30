package com.yedam.board.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.board.service.ReplyService;
import com.yedam.board.service.ReplyServiceImpl;
import com.yedam.board.vo.ReplyVO;
import com.yedam.common.Control;

public class ReplyListControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String brdNo = req.getParameter("brdNo");
		
		ReplyService service = new ReplyServiceImpl();
		List<ReplyVO> list = service.replyList(Long.parseLong(brdNo));
		
		Gson gson = new GsonBuilder().create();
		
		
		return gson.toJson(list)+".json";
	}

}
