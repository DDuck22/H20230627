package com.yedam.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.board.dao.ReplyMapper;
import com.yedam.board.service.ReplyService;
import com.yedam.board.service.ReplyServiceImpl;
import com.yedam.board.vo.ReplyVO;

public class TestMain {
	public static void main(String[] args) {
		SqlSession session = DataSource.getInstance().openSession(true);
		ReplyMapper mapper = session.getMapper(ReplyMapper.class);

//		String bno = req.getParameter("bno");
//		String reply = req.getParameter("reply");
//		String replyer = req.getParameter("replyer");
//		
//		ReplyVO vo = new ReplyVO();
//		vo.setBrdNo(Long.parseLong(bno));
//		vo.setReply(reply);
//		vo.setReplyer(replyer);
//		
//		ReplyService svc = new ReplyServiceImpl();
//		svc.addReply(vo);
		
		ReplyVO reply = new ReplyVO();
		reply.setBrdNo(246);
		reply.setReply("new102002");
		reply.setReplyer("new303030");
		
		mapper.insertReply(reply);
		
		reply = mapper.selectOne(reply.getReplyNo());
		System.out.println(reply.toString());
	}
}
