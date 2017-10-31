package kr.gudi.yumyum.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.gudi.util.HttpUtil;

import kr.gudi.yumyum.service.YumyumServiceInterface;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
public class yumyumController {

	@Autowired
	YumyumServiceInterface ysi;

	@RequestMapping("/Main")
	public ModelAndView main(ModelAndView mav) {
		mav.setViewName("main/main");
		return mav;
	}

	@RequestMapping("/Board")
	public ModelAndView board(ModelAndView mav, HttpSession session) {
		System.out.println(session.getAttribute("user"));
		session.getAttribute("user");
		mav.setViewName("/Board");
		return mav;
	}

	@RequestMapping("/Board1_Data")
	public void selectBoard(HttpServletResponse response, HttpServletRequest req) {
		HashMap<String, Object> paramMap = HttpUtil.getParameterMap(req);
		HttpUtil.sendResponceToJson(response, ysi.BoardSelectOne(paramMap));
	}

	@RequestMapping("/BoInput")
	public ModelAndView boinput(ModelAndView mav) {
		mav.setViewName("/BoInput");
		return mav;
	}

	@RequestMapping("/Manager")
	public ModelAndView manager(ModelAndView mav) {
		mav.setViewName("/Manager");
		return mav;
	}

	@RequestMapping("/Modallogin")
	public ModelAndView modallogin(ModelAndView mav) {
		mav.setViewName("/Modallogin");
		return mav;
	}

	@RequestMapping("/Recipe")
	public ModelAndView recipe(ModelAndView mav) {

		mav.setViewName("/Recipe");
		return mav;
	}

	@RequestMapping("/RE_Data")
	public void selectItem(HttpServletResponse response, HttpServletRequest req) {
		HashMap<String, Object> paramMap = HttpUtil.getParameterMap(req);
		HttpUtil.sendResponceToJson(response, ysi.recipeSelectOne(paramMap));
	}

	@RequestMapping("/ReInput")
	public ModelAndView reinput(ModelAndView mav) {
		mav.setViewName("/ReInput");
		return mav;
	}

	@RequestMapping("/BoardView")
	public ModelAndView boardview(ModelAndView mav) {
		mav.setViewName("/BoardView");
		return mav;
	}

	@RequestMapping("/Review")
	public ModelAndView review(ModelAndView mav , HttpSession session) {
		System.out.println(session.getAttribute("user"));
		mav.setViewName("/Review");
		return mav;
	}

	@RequestMapping("/BestReview")
	public ModelAndView Bestreview(ModelAndView mav) {
		mav.setViewName("/Review");
		return mav;
	}

	@RequestMapping("/Review_Data")
	public void ReviewselectItem(HttpServletResponse response, HttpServletRequest req) {
		HashMap<String, Object> paramMap = HttpUtil.getParameterMap(req);
		HttpUtil.sendResponceToJson(response, ysi.reviewSelectOne(paramMap));
	}

	@RequestMapping("/bestReview_Data")
	public void bestReviewselectItem(HttpServletResponse response, HttpServletRequest req) {
		HashMap<String, Object> paramMap = HttpUtil.getParameterMap(req);
		HttpUtil.sendResponceToJson(response, ysi.bestreviewSelectOne(paramMap));
	}
	@RequestMapping("/TokenCheck")
	public void tokenCheck(HttpServletResponse response, HttpServletRequest req, HttpSession session) {
		HashMap<String, Object> paramMap = HttpUtil.getParameterMap(req);
		System.out.println(paramMap);
		paramMap = ysi.tokenCheck(paramMap);
		session.setAttribute("user", paramMap);
		HttpUtil.sendResponceToJson(response, paramMap);
	}
}
