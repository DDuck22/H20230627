package com.yedam.calendar.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.calendar.service.CaledarServiceImpl;
import com.yedam.calendar.service.CalendarService;
import com.yedam.calendar.vo.CalendarVO;
import com.yedam.common.Control;

public class EventListControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {

		CalendarService service = new CaledarServiceImpl();
		List<CalendarVO> list = service.events();
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list);
		return json+".json";
	}

}
