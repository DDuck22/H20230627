package com.yedam.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.calendar.dao.CalendarMapper;
import com.yedam.calendar.vo.CalendarVO;

public class TestMain {
	public static void main(String[] args) {
		SqlSession session = DataSource.getInstance().openSession(true);
		CalendarMapper mapper = session.getMapper(CalendarMapper.class);
		
		CalendarVO vo = new CalendarVO();
		vo.setTitle("이런");
		mapper.delete(vo);
		
		List<CalendarVO> list = mapper.getList();
		for(CalendarVO cal : list) {
			System.out.println(cal);
		}
	}
}
