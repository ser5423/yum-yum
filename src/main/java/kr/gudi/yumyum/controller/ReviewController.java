package kr.gudi.yumyum.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.gudi.util.HttpUtil;

@Controller
public class ReviewController {

	@RequestMapping("/boardList")
	public void boardList(HttpServletRequest req, HttpServletResponse resp) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		HttpUtil.sendResponceToJson(resp, map);
	}
}
