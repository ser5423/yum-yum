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

	// boardview부분
	public HashMap<String, Object> BoardViewSelectOne(HashMap<String, Object> paramMap);

	public HashMap<String, Object> tokenCheck(HashMap<String, Object> paramMap);

	public int tokenAdd(HashMap<String, Object> paramMap);

	public int tokenUpdate(HashMap<String, Object> paramMap);

	public int insert(HashMap<String, Object> paramMap);

	// update부분
	public int update(HashMap<String, Object> paramMap);

	public HashMap<String, Object> Recipemodal(HashMap<String, Object> paramMap);

	public int delete(HashMap<String, Object> paramMap);

	HashMap<String, Object> BoardSelectOneTotCnt(HashMap<String, Object> paramMap);

	HashMap<String, Object> reviewSelectOneTotCnt(HashMap<String, Object> paramMap);

	HashMap<String, Object> bestreviewSelectOneTotCnt(HashMap<String, Object> paramMap);

	HashMap<String, Object> recipeSelectOneTotCnt(HashMap<String, Object> paramMap);

	HashMap<String, Object> VIEWCNT(HashMap<String, Object> paramMap);

	public HashMap<String, Object> managerlogin(HashMap<String, Object> paramMap);

	public int boinputEmail(HashMap<String, Object> paramMap);

	public HashMap<String, Object> boinputEmailCheck(HashMap<String, Object> paramMap);

	// review insert
	public int reinput(HashMap<String, Object> paramMap);
}
