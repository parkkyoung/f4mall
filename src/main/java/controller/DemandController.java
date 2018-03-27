package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CartDao;
import dao.DemandDao;
import service.StockService;
import vo.CartVo;
import vo.DemandVo;
import vo.MemberVo;
import vo.StockVo;

@Controller
public class DemandController {
	
	@Autowired
	DemandDao demand_dao;
	
	@Autowired
	CartDao cart_dao;
	
	@Autowired
	StockService stock_service;
	
	public DemandController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping("/demand_list.do")
	public String demand_insert(Integer [] i_no, Model model, String m_id, Integer cart_amt){
		
		int sales_price = demand_dao.selectTotalsales(m_id);
		
		List<CartVo> im_list = null;
		List<CartVo> d_list=new ArrayList<CartVo>();
		Map map = new HashMap();
		map.put("m_id", m_id);
		for(int i=0; i < i_no.length; i++){
			map.put("i_no", i_no[i]);
			im_list = demand_dao.demand_list(map);
			d_list.addAll(im_list);
		}
		
		model.addAttribute("sales_price",sales_price);
		model.addAttribute("d_list",d_list);
		return "front/demand";
	}
	
	@RequestMapping("/demand_one.do")
	public String demand_one(Integer i_no, Model model, String m_id, Integer cart_amt){
		
		Map map =new HashMap();
		map.put("i_no", i_no);
		map.put("m_id", m_id);
		map.put("cart_amt", cart_amt);
		
		CartVo vo = cart_dao.select_one(map);
		
		if(vo == null){
			int res = cart_dao.cart_insert(map);
		}
		if(vo.getCart_amt() != cart_amt){
			int res = cart_dao.update_cart(map);
		}
		
		int sales_price = demand_dao.selectTotalsales(m_id);
		
		List<CartVo> d_list = null;
		d_list = demand_dao.demand_list(map);

		model.addAttribute("sales_price",sales_price);
		model.addAttribute("d_list",d_list);
		
		return "front/demand";
	}
	
	@RequestMapping("/demand_insert.do")
	public String demand_insert(DemandVo vo, Integer [] cart_amt, Integer [] i_no){
		int res = 0;
		
		for(int i=0; i<i_no.length; i++){
			vo.setI_no(i_no[i]);
			int o_amt = cart_amt[i];
			vo.setO_amt(o_amt);
			res = demand_dao.demand_insert(vo);
			StockVo stock_vo =new StockVo();
			stock_vo.setI_no(i_no[i]);
			stock_vo.setS_amt(o_amt);
			try {
				res = stock_service.insert_out_stock(stock_vo);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return "redirect:index.do";
	}
}
