package com.yedam.member.control;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;

public class ChartDataControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		// {"name":"홍길동","age":20,"phone":"010-1234-5678"}
		String json = " {\"name\":\"홍길동\",\"age\":20,\"phone\":\"010-1234-5678\"}";
		json = "";

		MemberService service = new MemberServiceImpl();
		List<Map<String, Object>> list = service.getData();
		// [{"Administration":1},{},{}] <- js 배열 형식으로

		json = "[";
		int cnt = 1;
		for (Map<String, Object> map : list) {
			json += "{\"" + map.get("DEPARTMENT_NAME") + "\": " + map.get("CNT") + "}";
			// 마지막에 데이터가 아닌 경우에 ',' 추가.
			if (cnt++ != list.size()) {
				json += ",";
			}
		}
		json += "]";

		return json + ".json";
	}

}
