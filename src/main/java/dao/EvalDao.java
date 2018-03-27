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

	public double eval_total(Integer p_no) {
		// TODO Auto-generated method stub
		double avg_eval = 0;
		
		avg_eval = sqlSession.selectOne("eval_total",p_no);
		
		return avg_eval;
	}
	
	/**
	 * 상품평 리스트
	 * @return
	 */
	public List<EvalVo> select_list() {
		// TODO Auto-generated method stub
		List<EvalVo> e_list = null;
		e_list = sqlSession.selectList("eval_list");
		return e_list;
	}

	/**
	 * 상품별 상품평 리스트
	 * @param p_no
	 * @return
	 */
	public List<EvalVo> select_list(int p_no) {
		// TODO Auto-generated method stub
		List<EvalVo> e_list = null;
		e_list = sqlSession.selectList("eval_list_product", p_no);
		return e_list;
	}
	
	/**
	 * 상품평 삭제
	 * @param eval_no
	 * @return
	 */
	public int eval_delete(int eval_no) {
		// TODO Auto-generated method stub
		int res = 0;
		res = sqlSession.delete("eval_delete", eval_no);
		return res;
	}
	
	
}
