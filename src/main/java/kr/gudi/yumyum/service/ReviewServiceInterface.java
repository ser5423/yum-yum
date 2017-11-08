package kr.gudi.yumyum.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public interface ReviewServiceInterface {
	// review부분
	public HashMap<String, Object> reviewSelectOne(HashMap<String, Object> paramMap);

	public HashMap<String, Object> boardList(HashMap<String, Object> paramMap);
}
