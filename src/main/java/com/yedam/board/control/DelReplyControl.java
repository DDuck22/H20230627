package com.yedam.board.control;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.board.service.ReplyService;
import com.yedam.board.service.ReplyServiceImpl;
import com.yedam.common.Control;

public class DelReplyControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<>();
		
		
		String rno = req.getParameter("rno");
		
		ReplyService svc = new ReplyServiceImpl();
		if(svc.removeReply(Long.parseLong(rno))) {
			map.put("retCode", "Success");
		} else {
			map.put("retCode", "Fail");
		}
		Gson gson = new GsonBuilder().create();
				
		return gson.toJson(map)+".json";
	}

}
