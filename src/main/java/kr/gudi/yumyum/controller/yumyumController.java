package kr.gudi.yumyum.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

	// board에 입력된 자료 클릭 시 보이는 부분
	@RequestMapping("/BoardView_Data")
	public void selectBoardView(HttpServletResponse response, HttpServletRequest req) {
		HashMap<String, Object> paramMap = HttpUtil.getParameterMap(req);
		HttpUtil.sendResponceToJson(response, ysi.BoardViewSelectOne(paramMap));
	}

	@RequestMapping("/BoInput")
	public ModelAndView boinput(ModelAndView mav) {
		mav.setViewName("/BoInput");
		return mav;
	}
	// 글쓰기 화면에 글을 작성시 데이터 입력 부분
		@RequestMapping("/BoInput_Data")
		public void insert(HttpServletResponse response, HttpServletRequest req, @RequestParam Map<String, Object> paramMapa) {
			HashMap<String, Object> paramMap = HttpUtil.getParameterMap(req);
			System.out.println(paramMap);

			// ysi.insert(paramMap) : 입력받은 데이터(paramMap) 서비스로 보내기
			// rstMap : 리턴된 값 받는 곳
			HashMap<String, Object> rstMap = ysi.insert(paramMap);
			// rstCnt: 삽입 된 갯수 => DB에 삽입이 되었는지 안되었는지 확인하기 위해
			// rstInsertCnt: 서비스에서 리턴된 값
			int rstCnt = (int)rstMap.get("rstInsertCnt");
			// rstCNt 삽입 된 갯수야 ... .   갯수는  0 , 1  즉 , 0은 실패 1은 성공이야 .. 조건은  0보다 작거나 같으면 실패 0보다 크면 성공.
			if(rstCnt > 0) { // msg , say, data, item,  직관적인 단어들 사요
			/**
			 * @param data: 알림 메시지
			 * @param : 이동할 주소
			 * */
				rstMap.put("data","글작성이 완료되었습니다.");
				rstMap.put("move",req.getContextPath()+"/Board?type="+paramMap.get("TYPE"));
				
			}else {
				rstMap.put("data","글작성이 실패하였습니다.");
				rstMap.put("move",req.getContextPath()+"/Main");
				
			}
			// 한대 맞아서 나도 떄려주고싶은데 .... 때릴수 있는 유일한 수단.
			HttpUtil.sendResponceToJson(response, rstMap);
			// jsp -> 데이터 글작성 했다던가 ? -> 데이터 전송 -> 컨트롤러 -> db -> return Map -> json 변환을 해 ->
			// jsp 다시 받음.
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
	public ModelAndView review(ModelAndView mav, HttpSession session) {
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
//	@RequestMapping("/reviewSearch_Data")
//	public void reviewSearch(HttpServletResponse response, HttpServletRequest req) {
//		HashMap<String, Object> paramMap = HttpUtil.getParameterMap(req);
//		HttpUtil.sendResponceToJson(response, ysi.reviewSearch(paramMap));
//	}
}
