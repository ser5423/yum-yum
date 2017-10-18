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
	
	@RequestMapping("/Login")
	public void login(HttpServletRequest req, HttpServletResponse resp){
		HashMap<String, Object> param = HttpUtil.getParameterMap(req);
		System.out.println(param);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(!("").equals(param.get("email"))){
			map.put("email", param.get("email"));
			map.put("stat", true);
		}else {
			map.put("stat", false);
		}
		HttpUtil.sendResponceToJson(resp, map);
	}
	
	@RequestMapping("/listData")
	public ModelAndView listData(ModelAndView mav, HttpServletRequest req){
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		// 디비에서 받아 온 hashmap 데이터를 json으로 변경하여 model 값으로 넣어 준다.
		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(ysi.select(param)));
		mav.addObject("message", jsonObject.toString());
		
		mav.setViewName("re1");
		return mav;
	}
}
