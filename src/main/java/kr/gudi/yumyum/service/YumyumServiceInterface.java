package kr.gudi.yumyum.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public interface YumyumServiceInterface {
	public HashMap<String, Object> recipeSelectOne(HashMap<String, Object> paramMap);

	public HashMap<String, Object> BoardSelectOne(HashMap<String, Object> paramMap);

	// review부분
	public HashMap<String, Object> reviewSelectOne(HashMap<String, Object> paramMap);

	// bestreview부분
	public HashMap<String, Object> bestreviewSelectOne(HashMap<String, Object> paramMap);

	// boardview
	public HashMap<String, Object> BoardViewSelectOne(HashMap<String, Object> paramMap);

	public HashMap<String, Object> tokenCheck(HashMap<String, Object> paramMap);

	public HashMap<String, Object> reviewSearch(HashMap<String, Object> paramMap);

	// insert부분
	public HashMap<String, Object> insert(HashMap<String, Object> paramMap);

	public HashMap<String, Object> update(HashMap<String, Object> paramMap, HttpServletRequest req);
}
