package dao.stockdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.StockVo;

@Repository("stock_dao_inv")
public class StockInvDaoImpl implements StockDao{

	@Autowired
	SqlSession sqlSession;
	
	public StockInvDaoImpl() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public List<StockVo> select_list() {
		// TODO Auto-generated method stub
		List<StockVo> list = null;
		
		list = sqlSession.selectList("stock_inv_list");
		
		return list;
	}
	
	@Override
	public int insert(StockVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int update(StockVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		res = sqlSession.update("update_inv_stock",vo);
		
		return res;
	}

	@Override
	public StockVo select_one(int i_no) {
		// TODO Auto-generated method stub
		StockVo vo = null;
		
		vo = sqlSession.selectOne("select_one_inv",i_no);
		
		return vo;
	}

	@Override
	public int delete(StockVo vo) {
		// TODO Auto-generated method stub
		
		return 0;
	}
}
