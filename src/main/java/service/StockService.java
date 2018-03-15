package service;

import java.util.Map;

import vo.StockVo;

public interface StockService {

	Map select_list();
	int insert_in_stock(StockVo vo);
	int insert_out_stock(StockVo vo) throws Exception;
	int delete_stock_in(StockVo vo);
	int delete_stock_out(StockVo vo);
	
}
