package dao.stockdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.StockVo;

public interface StockDao {
	int insert(StockVo vo);
	int update(StockVo vo);
	List<StockVo> select_list();
	StockVo select_one(int i_no);
	int delete(StockVo vo);
}
