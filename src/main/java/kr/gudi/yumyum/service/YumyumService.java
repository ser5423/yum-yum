package kr.gudi.yumyum.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
		if (("KF").equals(paramMap.get("type"))) {
			food = "한식";
		} else if (("JF").equals(paramMap.get("type"))) {
			food = "일식";
		} else if (("CF").equals(paramMap.get("type"))) {
			food = "중식";
		} else if (("EF").equals(paramMap.get("type"))) {
			food = "양식";
		}
		map.put("list", ydi.recipeSelectOne(paramMap));
		map.put("food", food);
		map.put("ToT", ydi.recipeSelectOneTotCnt(paramMap));
		System.out.println(map);
		return map;
	}

	   //board부분
	   @Override
	   public HashMap<String, Object> BoardSelectOne(HashMap<String, Object> paramMap) {
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      String board = "";
	      if (("fr").equals(paramMap.get("type"))) {
	         board = "자유게시판";
	      } else if (("no").equals(paramMap.get("type"))) {
	         board = "공지사항";
	      } else if (("qa").equals(paramMap.get("type"))) {
	         board = "QnA";
	      }

	      map.put("list", ydi.BoardSelectOne(paramMap));
	      //Board Paging부분
	      map.put("ToT", ydi.BoardSelectOneTotCnt(paramMap));
	      map.put("Board", board);
	      System.out.println(map);
	      return map;
	   }

	   // Review부분
	   @Override
       public HashMap<String, Object> reviewSelectOne(HashMap<String, Object> paramMap) {
           HashMap<String, Object> map = new HashMap<String, Object>();
           String text = "";
           if (("0").equals(paramMap.get("RECOMMEND"))) {
              text = "리뷰";
           } else if (("1").equals(paramMap.get("RECOMMEND"))) {
              text = "우수리뷰";
           }
          map.put("list", ydi.reviewSelectOne(paramMap));
          map.put("text1", text);
          map.put("ToT", ydi.reviewSelectOneTotCnt(paramMap));
          System.out.println(map);
          return map;
       }

	      // bestReview부분
	      @Override
	      public HashMap<String, Object> bestreviewSelectOne(HashMap<String, Object> paramMap) {
	         HashMap<String, Object> map = new HashMap<String, Object>();
	         String text = "우수리뷰";
	         map.put("list", ydi.bestreviewSelectOne(paramMap));
	         map.put("text2", text);
	         map.put("ToT", ydi.bestreviewSelectOneTotCnt(paramMap));
	         System.out.println(map);
	         return map;
	      }


	// boardview
	@Override
	public HashMap<String, Object> BoardViewSelectOne(HashMap<String, Object> paramMap) {
		HashMap<String, Object> map = new HashMap<String, Object>();
	      String boardview = "";
	      map.put("boardview", ydi.BoardViewSelectOne(paramMap));
	      map.put("VIEWCNT", ydi.VIEWCNT(paramMap));
	      System.out.println(map);
	      return map;
	}

	@Override
	public HashMap<String, Object> tokenCheck(HashMap<String, Object> paramMap) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> user = new HashMap<String, Object>();
		map = ydi.tokenCheck(paramMap);
		System.out.println(map);
		if (map == null) {
			map = new HashMap<String, Object>();
			map.put("state", ydi.tokenAdd(paramMap));

			// System.out.println(map);
		} else {
			int state = ydi.tokenUpdate(paramMap);
			if (state == 1) {
				System.out.println("행복이란...");
			} else {
				System.out.println("우울함...");
			}
			// System.out.println(map);
		}

		map = ydi.tokenCheck(paramMap);

		return map;
	}
	
	@Override
	public HashMap<String, Object> boinputEmailCheck(HashMap<String, Object> paramMap) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> user = new HashMap<String, Object>();
		map = ydi.boinputEmailCheck(paramMap);
		System.out.println(map);
		if (map == null) {
			map = new HashMap<String, Object>();
			map.put("EMAIL", ydi.boinputEmail(paramMap));

			// System.out.println(map);
		}
		map = ydi.boinputEmailCheck(paramMap);

		return map;
	}

	// insert부분
	@Override
	public HashMap<String, Object> insert(HashMap<String, Object> paramMap, HttpServletRequest req) {
		HashMap<String, Object> rstMap = new HashMap<String, Object>();
		int rstInsertCnt = ydi.insert(paramMap);
		rstMap.put("rstInsertCnt", rstInsertCnt);
		
		
		// rstInsertCnt 삽입 된 갯수, 갯수는 0 , 1  => 즉 , 0은 실패 1은 성공, 조건은 0보다 작거나 같으면
	   // 실패 0보다 크면 성공.
		if (rstInsertCnt > 0) { // msg , say, data, item, 직관적인 단어들 사요
			
			rstMap.put("data", "글작성이 완료되었습니다.");
			rstMap.put("move", req.getContextPath() + "/Board?type=" + paramMap.get("TYPE"));

		} else {
			rstMap.put("data", "글작성이 실패하였습니다.");
			rstMap.put("move", req.getContextPath() + "/Main");

		}
		return rstMap;
	}

	// update부분
	@Override
	public HashMap<String, Object> update(HashMap<String, Object> paramMap, HttpServletRequest req) {
		HashMap<String, Object> rstMap = new HashMap<String, Object>();
		int rstUpdateCnt = ydi.update(paramMap);
		System.out.println(rstUpdateCnt);
		if (rstUpdateCnt > 0) {
			rstMap.put("msg", "글수정이 완료되었습니다.");
			rstMap.put("move", req.getContextPath() + "/BoardView?NO=" + paramMap.get("NO"));
		} else {
			rstMap.put("msg", "글수정을 실패하였습니다.");
			rstMap.put("move", req.getContextPath() + "/BoardView?NO=" + paramMap.get("NO"));

		}
		return rstMap;
	}
	@Override
	public HashMap<String, Object> Recipemodal(HashMap<String, Object> paramMap) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String Recipemodal = "";
		map.put("Recipemodal", ydi.Recipemodal(paramMap));
		System.out.println(map);
		
		return map;
	}
	@Override
	   public HashMap<String, Object> delete(HashMap<String, Object> paramMap, HttpServletRequest req) {
	      HashMap<String, Object> rstMap = new HashMap<String, Object>();
	      int rstUpdateCnt = ydi.delete(paramMap);
	      if(rstUpdateCnt > 0) {
	         rstMap.put("msg","글삭제가 완료되었습니다.");
	         rstMap.put("move",req.getContextPath()+"/Board?type="+paramMap.get("type"));
	      }else{
	         rstMap.put("msg","글삭제를 실패하였습니다.");
	         rstMap.put("move",req.getContextPath()+"/BoardView?NO="+paramMap.get("NO"));
	         
	      }
	      return rstMap;
	   }

	@Override
	public HashMap<String, Object> managerlogin(HashMap<String, Object> paramMap) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> manager = new HashMap<String, Object>();
		map = ydi.managerlogin(paramMap);
		System.out.println(map);
		if (map == null) {
//			System.out.println("로그인 실패");
			manager.put("msg","로그인 실패");
			manager.put("link", "http://localhost:9090/yumyum/Managerlogin");
			// System.out.println(map);
		} else {
//			System.out.println("로그인 성공");
			manager.put("msg","로그인 성공");
			manager.put("link", "http://localhost:9090/yumyum/Main");
		}

		return map;
	}

	@Override
	public HashMap<String, Object> reinput(HashMap<String, Object> paramMap, HttpServletRequest req) {
		HashMap<String, Object> rstMap = new HashMap<String, Object>();
		int rstInsertCnt = ydi.reinput(paramMap);
		rstMap.put("rstInsertCnt", rstInsertCnt);
	
		if (rstInsertCnt > 0) { // msg , say, data, item, 직관적인 단어들 사요
			
			rstMap.put("data", "글작성이 완료되었습니다.");
			rstMap.put("move", req.getContextPath() + "/Review");

		} else {
			rstMap.put("data", "글작성이 실패하였습니다.");
			rstMap.put("move", req.getContextPath() + "/Main");

		}
		return rstMap;
	}

	
}