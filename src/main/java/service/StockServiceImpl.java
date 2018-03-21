package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.stockdao.StockDao;
import vo.StockVo;

@Service
public class StockServiceImpl implements StockService{

	@Autowired
	StockDao stock_dao_in;
	@Autowired
	StockDao stock_dao_out;
	@Autowired
	StockDao stock_dao_inv;
	
	@Override
	public Map select_list() {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		
		List<StockVo> in_list = stock_dao_in.select_list();
		List<StockVo> out_list = stock_dao_out.select_list();
		List<StockVo> inv_list = stock_dao_inv.select_list();
		
		map.put("in_list", in_list);
		map.put("out_list", out_list);
		map.put("inv_list", inv_list);
		
		return map;
	}
	
	@Override
	public int insert_in_stock(StockVo vo) {
		// TODO Auto-generated method stub
		
		int res = 0;
		res = stock_dao_in.insert(vo);
		
		StockVo inv_vo = stock_dao_inv.select_one(vo.getI_no());
		System.out.println(inv_vo);
		if(inv_vo==null){
			res = stock_dao_inv.insert(vo);
		}else{
			int amt = inv_vo.getS_amt() + vo.getS_amt();
			inv_vo.setS_amt(amt);
			res = stock_dao_inv.update(inv_vo);
		}
		
		return res;
	}

	@Override
	public int insert_out_stock(StockVo vo) throws Exception {
		// TODO Auto-generated method stub
		int res = 0;
		res= stock_dao_out.insert(vo);
		
		StockVo inv_vo = stock_dao_inv.select_one(vo.getI_no());
		if(inv_vo.getS_amt() < vo.getS_amt()){
			throw new Exception("재고량이 부족합니다");
		}
		
		if(inv_vo == null){
			throw new Exception("등록된 상품이 없습니다");
		}
		
		int amt = inv_vo.getS_amt() - vo.getS_amt();
		inv_vo.setS_amt(amt);
		
		res = stock_dao_inv.update(inv_vo);
		
		return res;
	}

	@Override
	public int delete_stock_in(StockVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		res = stock_dao_in.delete(vo);
		
		StockVo inv_vo = stock_dao_inv.select_one(vo.getI_no());
		int amt = inv_vo.getS_amt() - vo.getS_amt();
		inv_vo.setS_amt(amt);
		res = stock_dao_inv.update(inv_vo);
		
		return res;
	}

	@Override
	public int delete_stock_out(StockVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		res = stock_dao_out.delete(vo);
		
		StockVo inv_vo = stock_dao_inv.select_one(vo.getI_no());
		int amt = inv_vo.getS_amt() + vo.getS_amt();
		inv_vo.setS_amt(amt);
		res = stock_dao_inv.update(inv_vo);
		
		return res;
	}
	
}
