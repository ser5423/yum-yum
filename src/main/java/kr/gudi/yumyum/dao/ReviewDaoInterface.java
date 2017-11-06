package kr.gudi.yumyum.dao;

import java.util.HashMap;
import java.util.List;

public interface ReviewDaoInterface {
	// Review 부분
	public List<HashMap<String, Object>> reviewSelectOne(HashMap<String, Object> paramMap);
}
