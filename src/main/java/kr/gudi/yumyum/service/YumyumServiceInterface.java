package kr.gudi.yumyum.service;

import java.util.HashMap;

public interface YumyumServiceInterface {
	public HashMap<String, Object> recipeSelectOne(HashMap<String, Object> paramMap);
	public HashMap<String, Object> BoardSelectOne(HashMap<String, Object> paramMap);
	 // review부분
	   public HashMap<String, Object> reviewSelectOne(HashMap<String, Object> paramMap);
	   
	   // bestreview부분
	   public HashMap<String, Object> bestreviewSelectOne(HashMap<String, Object> paramMap);
}
