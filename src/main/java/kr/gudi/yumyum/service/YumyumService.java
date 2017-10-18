package kr.gudi.yumyum.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.yumyum.dao.yumyumDaoInterface;

@Service
public class YumyumService implements YumyumServiceInterface {
	
	@Autowired
	yumyumDaoInterface ydi;

	@Override
	public HashMap<String, Object> select(HashMap<String, Object> param) {
		
		List<HashMap<String, Object>> list = ydi.select(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);

		return map;
	}

	@Override
	public HashMap<String, Object> select2(HashMap<String, Object> param) {
		List<HashMap<String, Object>> list = ydi.select2(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		
		return map;
	}

	@Override
	public HashMap<String, Object> select3(HashMap<String, Object> param) {
		List<HashMap<String, Object>> list = ydi.select3(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		
		return map;
	}

	@Override
	public HashMap<String, Object> select4(HashMap<String, Object> param) {
		List<HashMap<String, Object>> list = ydi.select4(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		
		return map;
	}
}
