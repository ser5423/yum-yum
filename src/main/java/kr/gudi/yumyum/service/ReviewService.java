package kr.gudi.yumyum.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.yumyum.dao.yumyumDaoInterface;

@Service
public class ReviewService implements ReviewServiceInterface {

	@Autowired
	yumyumDaoInterface ydi;

	// Review부분
	@Override
	public HashMap<String, Object> reviewSelectOne(HashMap<String, Object> paramMap) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String text = "리뷰";
		map.put("list", ydi.reviewSelectOne(paramMap));
		map.put("text1", text);
		map.put("ToT", ydi.reviewSelectOneTotCnt(paramMap));
		System.out.println(map);
		return map;
	}

	@Override
	public HashMap<String, Object> boardList(HashMap<String, Object> paramMap) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", ydi.reviewSelectOne(paramMap));
		System.out.println(map);
		return map;
	}
	
}