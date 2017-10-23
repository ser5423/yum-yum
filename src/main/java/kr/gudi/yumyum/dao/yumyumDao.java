package kr.gudi.yumyum.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class yumyumDao implements yumyumDaoInterface {
	
	@Resource(name="sqlSession")
	SqlSession session;

	@Override
	public List<HashMap<String, Object>> select(HashMap<String, Object> param) {
		return session.selectList("yumyum.recipe1", param);
	}
	@Override
	public List<HashMap<String, Object>> select2(HashMap<String, Object> param) {
		return session.selectList("yumyum.recipe2", param);
	}
	@Override
	public List<HashMap<String, Object>> select3(HashMap<String, Object> param) {
		return session.selectList("yumyum.recipe3", param);
	}
	@Override
	public List<HashMap<String, Object>> select4(HashMap<String, Object> param) {
		return session.selectList("yumyum.recipe4", param);
	}
}
