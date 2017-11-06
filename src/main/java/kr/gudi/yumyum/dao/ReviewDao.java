package kr.gudi.yumyum.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDao implements ReviewDaoInterface {

	private static final String NS = "yumyum.";

	@Resource(name = "sqlSession")
	SqlSession session;

	// Review 부분
	@Override
	public List<HashMap<String, Object>> reviewSelectOne(HashMap<String, Object> paramMap) {
		return session.selectList(NS + "reviewSelectOne", paramMap);
	}
	
}
