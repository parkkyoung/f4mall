package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.EvalVo;

@Repository
public class EvalDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public EvalDao() {
		// TODO Auto-generated constructor stub
	}

	public List<EvalVo> possible_eval(Map map) {
		// TODO Auto-generated method stub
		List<EvalVo> list = null;
		
		list = sqlSession.selectList("ok_eval",map);
		
		return list;
	}

	public int insert_eval(EvalVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		res = sqlSession.insert("insertEval", vo);
		
		return res;
	}

	public EvalVo select_one(Integer eval_no) {
		// TODO Auto-generated method stub
		EvalVo vo = null;
		
		vo = sqlSession.selectOne("select_one",eval_no);
		
		return vo;
	}
	
	
}
