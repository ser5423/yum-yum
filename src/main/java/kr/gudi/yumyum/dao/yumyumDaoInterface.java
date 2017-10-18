package kr.gudi.yumyum.dao;

import java.util.HashMap;
import java.util.List;

public interface yumyumDaoInterface {
	public List<HashMap<String, Object>> select(HashMap<String, Object> param);
	public List<HashMap<String, Object>> select2(HashMap<String, Object> param);
	public List<HashMap<String, Object>> select3(HashMap<String, Object> param);
	public List<HashMap<String, Object>> select4(HashMap<String, Object> param);

}
