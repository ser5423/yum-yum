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
	public HashMap<String, Object> recipeSelectOne(HashMap<String, Object> paramMap) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String food = "";
		if(("KF").equals(paramMap.get("type"))){
			food = "한식";
		}else if(("JF").equals(paramMap.get("type"))){
			food = "일식";
		}else if(("CF").equals(paramMap.get("type"))){
			food = "중식";
		}else if(("EF").equals(paramMap.get("type"))){
			food = "양식";
		}
		map.put("list", ydi.recipeSelectOne(paramMap));
		map.put("food", food);
		System.out.println(map);
		return map;
	}
}
