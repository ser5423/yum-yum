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
	@Override
	   public HashMap<String, Object> BoardSelectOne(HashMap<String, Object> paramMap) {
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      String board = "";
	      if(("fr").equals(paramMap.get("type"))){
	         board = "자유";
	      }else if(("no").equals(paramMap.get("type"))){
	         board = "공지";
	      }else if(("qa").equals(paramMap.get("type"))){
	         board = "질문";
	      }
	   
	   map.put("list", ydi.BoardSelectOne(paramMap));
	   map.put("Board", board);
	   System.out.println(map);
	      return map;
	   }
	 // Review부분
	   @Override
	   public HashMap<String, Object> reviewSelectOne(HashMap<String, Object> paramMap){
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      String text="";
	      map.put("list", ydi.reviewSelectOne(paramMap));
	      map.put("text", text);
	      System.out.println(map);
	      return map;
	   }
	   
	   
	   // bestReview부분
	   @Override
	   public HashMap<String, Object> bestreviewSelectOne(HashMap<String, Object> paramMap){
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      String text="";
	      map.put("list", ydi.bestreviewSelectOne(paramMap));
	      map.put("text", text);
	      System.out.println(map);
	      return map;
	   }
}
