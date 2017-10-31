package kr.gudi.yumyum.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class yumyumDao implements yumyumDaoInterface {

	private static final String NS = "yumyum.";

	@Resource(name = "sqlSession")
	SqlSession session;

	@Override
	public List<HashMap<String, Object>> recipeSelectOne(HashMap<String, Object> paramMap) {
		return session.selectList(NS + "recipeSelectOne", paramMap);
	}

	@Override
	public List<HashMap<String, Object>> BoardSelectOne(HashMap<String, Object> paramMap) {
		return session.selectList(NS + "BoardSelectOne", paramMap);
	}

	// Review 부분
	@Override
	public List<HashMap<String, Object>> reviewSelectOne(HashMap<String, Object> paramMap) {
		return session.selectList(NS + "reviewSelectOne", paramMap);
	}

	// BestReview 부분
	@Override
	public List<HashMap<String, Object>> bestreviewSelectOne(HashMap<String, Object> paramMap) {
		return session.selectList(NS + "bestreviewSelectOne", paramMap);

	}

	@Override
	public HashMap<String, Object> tokenCheck(HashMap<String, Object> paramMap) {
		return session.selectOne(NS + "tokenCheck", paramMap);
	}

	@Override
	public int tokenAdd(HashMap<String, Object> paramMap) {
		return session.insert(NS + "tokenAdd", paramMap);
	}

	@Override
	public int tokenUpdate(HashMap<String, Object> paramMap) {
		System.out.println(paramMap);
		return session.update(NS + "tokenUpdate", paramMap);
	}
	@Override
	   public int insert(HashMap<String, Object> paramMap) {
	      return session.insert(NS+"insert",paramMap);
	   }

	// boardview부분
	@Override
	public HashMap<String, Object> BoardViewSelectOne(HashMap<String, Object> paramMap) {
		return session.selectOne(NS + "BoardviewSelectOne", paramMap);
	}
//	@Override
//	public List<HashMap<String, Object>> reviewSearch(HashMap<String, Object> paramMap) {
//		return session.selectList(NS + "reviewSearch", paramMap);
//	}

}
