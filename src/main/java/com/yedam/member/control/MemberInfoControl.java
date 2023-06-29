package com.yedam.member.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;

public class MemberInfoControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		// getMember(id), select(id)
		// admin/memberInfo.jsp
		String id = req.getParameter("uid");
		
		MemberService service = new MemberServiceImpl();
		MemberVO result = service.getMember(id);
		
		req.setAttribute("member", result);
		return "admin/memberInfo.tiles";
	}

}
