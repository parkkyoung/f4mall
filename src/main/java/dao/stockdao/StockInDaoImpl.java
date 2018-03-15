package dao.stockdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.StockVo;

@Repository("stock_dao_in")
public class StockInDaoImpl implements StockDao{

	@Autowired
	SqlSession sqlSession;
	
	public StockInDaoImpl() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public List<StockVo> select_list() {
		// TODO Auto-generated method stub
		List<StockVo> list = null;
		
		list = sqlSession.selectList("stock_in_list");
		
		return list;
	}
	
	@Override
	public int insert(StockVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		res = sqlSession.insert("insert_in_stock",vo);
		
		return res;
	}
	
	@Override
	public int update(StockVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public StockVo select_one(int i_no) {
		// TODO Auto-generated method stub
		
		
		return null;
	}

	@Override
	public int delete(StockVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		res = sqlSession.delete("delete_in_stock",vo);
		
		return res;
	}

}
