package kr.gudi.yumyum.dao;

import java.util.HashMap;
import java.util.List;

public interface yumyumDaoInterface {
	public List<HashMap<String, Object>> recipeSelectOne(HashMap<String, Object> paramMap);

	public List<HashMap<String, Object>> BoardSelectOne(HashMap<String, Object> paramMap);

	// Review 부분
	public List<HashMap<String, Object>> reviewSelectOne(HashMap<String, Object> paramMap);

	// BestReview 부분
	public List<HashMap<String, Object>> bestreviewSelectOne(HashMap<String, Object> paramMap);

	public HashMap<String, Object> tokenCheck(HashMap<String, Object> paramMap);

	public int tokenAdd(HashMap<String, Object> paramMap);
	public int tokenUpdate(HashMap<String, Object> paramMap);
}
