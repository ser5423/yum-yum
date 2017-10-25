package kr.gudi.yumyum.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public ModelAndView main(ModelAndView mav){
		mav.setViewName("main/main");
		return mav;
	}
	@RequestMapping("/Board")
	public ModelAndView board(ModelAndView mav){
		mav.setViewName("/Board");
		return mav;
	}
	@RequestMapping("/BoInput")
	public ModelAndView boinput(ModelAndView mav){
		mav.setViewName("/BoInput");
		return mav;
	}
	@RequestMapping("/Manager")
	public ModelAndView manager(ModelAndView mav){
		mav.setViewName("/Manager");
		return mav;
	}
	@RequestMapping("/Modallogin")
	public ModelAndView modallogin(ModelAndView mav){
		mav.setViewName("/Modallogin");
		return mav;
	}
	@RequestMapping("/Recipe")
	public ModelAndView recipe(ModelAndView mav){
		
		mav.setViewName("/Recipe");
		return mav;
	}
	
	@RequestMapping("/RE_Data")
	public void selectItem(HttpServletResponse response, HttpServletRequest req) {
		HashMap<String, Object> paramMap = HttpUtil.getParameterMap(req);
		HttpUtil.sendResponceToJson(response, ysi.recipeSelectOne(paramMap));
	}
	@RequestMapping("/ReInput")
	public ModelAndView reinput(ModelAndView mav){
		mav.setViewName("/ReInput");
		return mav;
	}
	@RequestMapping("/Review")
	public ModelAndView review(ModelAndView mav){
		mav.setViewName("/Review");
		return mav;
	}
	@RequestMapping("/BoardView")
	public ModelAndView boardview(ModelAndView mav){
		mav.setViewName("/BoardView");
		return mav;
	}
	@RequestMapping("/Review")
	public ModelAndView reviewview(ModelAndView mav){
		mav.setViewName("/Reviewview");
		return mav;
	}
	
}
