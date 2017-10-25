package kr.gudi.yumyum.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class yumyumDao implements yumyumDaoInterface {
	
	private static final String NS = "yumyum.";
	
	@Resource(name="sqlSession")
	SqlSession session;

	@Override
	public List<HashMap<String, Object>> recipeSelectOne(HashMap<String, Object> paramMap) {
		return session.selectList(NS+"recipeSelectOne",paramMap);
	}
	@Override
	   public List<HashMap<String, Object>> BoardSelectOne(HashMap<String, Object> paramMap) {
	      return session.selectList(NS+"BoardSelectOne",paramMap);
	}
}
