package com.yedam.board.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.board.service.ReplyService;
import com.yedam.board.service.ReplyServiceImpl;
import com.yedam.board.vo.ReplyVO;
import com.yedam.common.Control;

public class ReplyControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String rno = req.getParameter("rno");
		ReplyService svc = new ReplyServiceImpl();
		ReplyVO reply = svc.getReply(Long.parseLong(rno));
		
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(reply)+".json";
	}

}
