package kr.gudi.yumyum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.gudi.util.BoardFile;
import kr.gudi.util.HttpUtil;
import kr.gudi.yumyum.service.YumyumServiceInterface;

@Controller
public class yumyumController {

	@Autowired
	YumyumServiceInterface ysi;

	private static final Logger logger = Logger.getLogger(yumyumController.class);

	
	@RequestMapping("/Main")
	public ModelAndView main(ModelAndView mav, HttpSession session) {
		session.getAttribute("manager");
		mav.setViewName("main/main");
		return mav;
	}

	@RequestMapping("/Managerlogin1")
	public ModelAndView managerlogin(ModelAndView mav, HttpServletResponse response, HttpServletRequest req, HttpSession session, Model model)
			throws IOException {
		HashMap<String, Object> paramMap = HttpUtil.getParameterMap(req);
		paramMap = ysi.managerlogin(paramMap);
		session.setAttribute("manager", paramMap);
		HttpUtil.sendResponceToJson(response, paramMap);

		if (paramMap == null) {
			response.sendRedirect("/yumyum/Managerlogin");
		} else {
			response.sendRedirect("/yumyum/Main");
		}
		return HttpUtil.makeHashToJsonModelAndView(ysi.managerlogin(paramMap));
	}

	@RequestMapping("/logout")
	public ModelAndView logout(ModelAndView mav, HttpSession session) {
		session.invalidate();
		mav.setViewName("redirect:/Main");
		return mav;
	}

	@RequestMapping("/Board")
	public ModelAndView board(ModelAndView mav, HttpSession session) {
		session.getAttribute("manager");
		session.getAttribute("user");
		mav.setViewName("/Board");
		return mav;
	}

	@RequestMapping("/Board1_Data")
	public ModelAndView selectBoard(HttpServletRequest req) {
		HashMap<String, Object> paramMap = HttpUtil.getParameterMap(req);
		return HttpUtil.makeHashToJsonModelAndView(ysi.BoardSelectOne(paramMap));
	}

	// board에 입력된 자료 클릭 시 보이는 부분
	@RequestMapping("/BoardView_Data")
	public ModelAndView selectBoardView( HttpServletRequest req) {
		HashMap<String, Object> paramMap = HttpUtil.getParameterMap(req);
		return HttpUtil.makeHashToJsonModelAndView(ysi.BoardViewSelectOne(paramMap));
	}

	@RequestMapping("/BoInput")
	public ModelAndView boinput(ModelAndView mav, HttpSession session, Model model,
			@RequestParam HashMap<String, Object> paramMap) {
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		HashMap<String, HashMap<String, Object>> manager = (HashMap<String, HashMap<String, Object>>) session.getAttribute("manager");

		if (user == null) {
			model.addAttribute("EMAIL", "");
		} else {
			model.addAttribute("EMAIL", user.get("EMAIL"));
		}

		if (manager == null) {
			model.addAttribute("EMAILmanager", "");
		} else {
			model.addAttribute("EMAILmanager", manager.get("EMAIL"));
		}

		// HashMap<String, Object> rstMap = new HashMap<String, Object>();
		// rstMap.put("EMAIL", user.get("EMAIL"));
		// rstMap.put("EMAILmanager", manager.get("EMAIL"));
		//
		// model.addAttribute("EMAIL",user.get("EMAIL"));
		// model.addAttribute("EMAILmanager",manager.get("EMAIL"));
		mav.setViewName("/BoInput");
		return mav;
	}

	// 글쓰기 화면에 글을 작성시 데이터 입력 부분
	@RequestMapping("/BoInput_Data")
	public void insert(HttpServletResponse response, @RequestParam("file") MultipartFile[] file,
			MultipartHttpServletRequest req, @RequestParam Map<String, Object> paramMapa) {
		HashMap<String, Object> paramMap = HttpUtil.getParameterMap(req);

		List<BoardFile> rstBoardFiles = HttpUtil.fileUpload(req, "board", null);
		HashMap<String, Object> rstMap = ysi.insert(paramMap, req);
		HttpUtil.sendResponceToJson(response, rstMap);
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
	public ModelAndView selectItem(HttpServletRequest req) {
		HashMap<String, Object> paramMap = HttpUtil.getParameterMap(req);
		return HttpUtil.makeHashToJsonModelAndView(ysi.recipeSelectOne(paramMap));
	}

	@RequestMapping("/ReInput")
	public ModelAndView reinput(HttpServletRequest req, ModelAndView mav, HttpSession session, Model model, @RequestParam HashMap<String, Object> paramMap) {
		
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		HashMap<String, HashMap<String, Object>> manager = (HashMap<String, HashMap<String, Object>>) session.getAttribute("manager");
//
//		
		HashMap<String, Object> rstMap = new HashMap<String, Object>();
//		
//		if (user == null) {
//			model.addAttribute("EMAIL", "");
//		} else {
//			model.addAttribute("EMAIL", user.get("EMAIL"));
//		}
//
		if (manager == null) {
			model.addAttribute("EMAILmanager", "");
		} else {
			model.addAttribute("EMAILmanager", manager.get("EMAIL"));
		}
		
//		rstMap.put("EMAIL", user.get("EMAIL"));
		
		mav.setViewName("/ReInput");
//		System.out.println(session.getAttribute("user"));
//		System.out.println(rstMap);
		return mav;
	}

	@RequestMapping("/BoardView")
	public ModelAndView boardview(ModelAndView mav, HttpSession session, Model model, HttpServletRequest req) {
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session
				.getAttribute("user");
		HashMap<String, HashMap<String, Object>> manager = (HashMap<String, HashMap<String, Object>>) session
				.getAttribute("manager");

		if (user == null) {
			model.addAttribute("EMAIL", "");
		} else {
			model.addAttribute("EMAIL", user.get("EMAIL"));
		}

		if (manager == null) {
			model.addAttribute("EMAILmanager", "");
		} else {
			model.addAttribute("EMAILmanager", manager.get("EMAIL"));
		}

		mav.setViewName("/BoardView");

		return mav;
	}

	@RequestMapping("/Review")
	public ModelAndView review(ModelAndView mav, HttpSession session) {
		session.getAttribute("manager");
		session.getAttribute("user");
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
		paramMap = ysi.tokenCheck(paramMap);
		session.setAttribute("user", paramMap);
		HttpUtil.sendResponceToJson(response, paramMap);
	}

	@RequestMapping("/GetNaverId")
	public void getNaverId(HttpServletResponse resp, HttpSession session) {
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session
				.getAttribute("user");
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (user == null) {
			map.put("state", 0);
		} else {
			map.put("EMAIL", user.get("EMAIL"));
			map.put("state", 1);
		}

		HttpUtil.sendResponceToJson(resp, map);
	}

	// update부분
	@RequestMapping("/BoUpdate_Data")
	public void update(HttpServletResponse response, HttpServletRequest req,
			@RequestParam Map<String, Object> paramMapa) {
		HashMap<String, Object> paramMap = HttpUtil.getParameterMap(req);
		HashMap<String, Object> rstMap = ysi.update(paramMap, req);

		HttpUtil.sendResponceToJson(response, rstMap);
	}

	// delete부분
	@RequestMapping("/BoDelete_Data")
	public void delete(HttpServletResponse response, HttpServletRequest req,
			@RequestParam Map<String, Object> paramMapa) {
		HashMap<String, Object> paramMap = HttpUtil.getParameterMap(req);
		HashMap<String, Object> rstMap = ysi.delete(paramMap, req);

		HttpUtil.sendResponceToJson(response, rstMap);
	}

	@RequestMapping("/Recipemodal_Data")
	public void Recipemodal(HttpServletResponse response, HttpServletRequest req) {
		HashMap<String, Object> paramMap = HttpUtil.getParameterMap(req);
		HttpUtil.sendResponceToJson(response, ysi.Recipemodal(paramMap));
	}

	@RequestMapping("/Managerlogin")
	public ModelAndView Managerlogin(ModelAndView mav, HttpSession session) {
		session.getAttribute("manager");
		mav.setViewName("/Managerlogin");
		return mav;
	}

	// 파일 업로드
	@RequestMapping("/upload")
	public void imgUpload(MultipartHttpServletRequest req, @RequestParam HashMap<String, Object> paramMap,
			HttpServletResponse res) {
		HashMap<String, Object> rstMap = ysi.fileupload(paramMap, req);

		List<BoardFile> files = (List<BoardFile>) rstMap.get("file");

		logger.info("##########################################\n" + files
				+ "\n#############################################");
		PrintWriter printWriter = null;
		try {
			res.setHeader("charset", "utf-8");
			res.setCharacterEncoding("utf-8");
			// 화면에 찍기
			printWriter = res.getWriter();
			// ck에서 지정된 약속
			/*
			 * <script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction('콜백의
			 * 식별 ID 값', '파일의 URL', '전송완료 메시지')</script>
			 */
			// 몇건, 이미지주소, 결과메세지 반환
			printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
					+ paramMap.get("CKEditorFuncNum") + ",'" + req.getContextPath() + files.get(0).getPath() + "','"
					+ rstMap.get("msg") + "'" + ")</script>");
			// flush() : 파일 남아 있는거 보내라 (마저보내라)
			printWriter.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (Exception e2) {
			}
		}

	}


	// 리뷰 데이터 입력
	@RequestMapping("/ReInput_Data")
	public void reinput(HttpServletResponse response, @RequestParam("file") MultipartFile[] file,
		MultipartHttpServletRequest req, @RequestParam HashMap<String, Object> paramMap) {
		HashMap<String, Object> rstMap = ysi.reinput(paramMap, req);
		HttpUtil.sendResponceToJson(response, rstMap);
	}
	
	@RequestMapping("/recommendup")
	public void recommendup(HttpServletRequest req, HttpServletResponse resp,
			@RequestParam HashMap<String, Object> paramMap) {
		HashMap<String, Object> rstMap = ysi.recommendup(paramMap, req);
		HttpUtil.sendResponceToJson(resp, rstMap);
	}

}
