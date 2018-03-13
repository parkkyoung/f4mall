package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.DemandDao;
import vo.CartVo;
import vo.DemandVo;
import vo.MemberVo;

@Controller
public class DemandController {
	
	@Autowired
	DemandDao demand_dao;
	
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
		
		System.out.println(d_list);
		
		model.addAttribute("sales_price",sales_price);
		model.addAttribute("d_list",d_list);
		return "front/demand";
	}
	
	@RequestMapping("/demand_insert.do")
	public String demand_insert(CartVo vo){
		int res = 0;
		
		res = demand_dao.demand_insert(vo);
		
		return "";
	}
}
