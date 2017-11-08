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

	// recipe Paging부분
	@Override
	public HashMap<String, Object> recipeSelectOneTotCnt(HashMap<String, Object> paramMap) {
		return session.selectOne(NS + "recipeSelectOneTotCnt", paramMap);
	}

	@Override
	public List<HashMap<String, Object>> BoardSelectOne(HashMap<String, Object> paramMap) {
		return session.selectList(NS + "BoardSelectOne", paramMap);
	}

	// Board Paging부분
	@Override
	public HashMap<String, Object> BoardSelectOneTotCnt(HashMap<String, Object> paramMap) {
		return session.selectOne(NS + "BoardSelectOneTotCnt", paramMap);
	}

	// Review 부분
	@Override
	public List<HashMap<String, Object>> reviewSelectOne(HashMap<String, Object> paramMap) {
		return session.selectList(NS + "reviewSelectOne", paramMap);
	}

	// review Paging부분
	@Override
	public HashMap<String, Object> reviewSelectOneTotCnt(HashMap<String, Object> paramMap) {
		return session.selectOne(NS + "reviewSelectOneTotCnt", paramMap);
	}

	// BestReview 부분
	@Override
	public List<HashMap<String, Object>> bestreviewSelectOne(HashMap<String, Object> paramMap) {
		return session.selectList(NS + "bestreviewSelectOne", paramMap);

	}

	// BestReview Paging부분
	@Override
	public HashMap<String, Object> bestreviewSelectOneTotCnt(HashMap<String, Object> paramMap) {
		return session.selectOne(NS + "bestreviewSelectOneTotCnt", paramMap);
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
		return session.update(NS + "tokenUpdate", paramMap);
	}

	@Override
	public int insert(HashMap<String, Object> paramMap) {
		return session.insert(NS + "insert", paramMap);
	}

	// boardview부분
	@Override
	public HashMap<String, Object> BoardViewSelectOne(HashMap<String, Object> paramMap) {
		return session.selectOne(NS + "BoardviewSelectOne", paramMap);
	}

	// update 부분
	@Override
	public int update(HashMap<String, Object> paramMap) {
		return session.insert(NS + "update", paramMap);
	}

	@Override
	public HashMap<String, Object> Recipemodal(HashMap<String, Object> paramMap) {
		return session.selectOne(NS + "Recipemodal", paramMap);
	}

	// delete부분
	@Override
	public int delete(HashMap<String, Object> paramMap) {
		return session.delete(NS + "delete", paramMap);

	}

	@Override
	public HashMap<String, Object> VIEWCNT(HashMap<String, Object> paramMap) {
		return session.selectOne(NS + "VIEWCNT", paramMap);
	}

	@Override
	public HashMap<String, Object> managerlogin(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return session.selectOne(NS + "managerlogin", paramMap);
	}

	@Override
	public int boinputEmail(HashMap<String, Object> paramMap) {
		return session.insert(NS + "boinputEmail", paramMap);
	}

	@Override
	public HashMap<String, Object> boinputEmailCheck(HashMap<String, Object> paramMap) {
		return session.selectOne(NS + "boinputEmailCheck", paramMap);
	}

	@Override
	public int reinput(HashMap<String, Object> paramMap) {
		return session.insert(NS + "reviewinsert", paramMap);
	}

	@Override
	public int recommendup(HashMap<String, Object> param) {
		return session.update(NS + "recommendup", param);
	}
}
