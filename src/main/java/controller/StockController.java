package controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ItemsDao;
import dao.stockdao.StockDao;
import service.StockService;
import vo.StockVo;

@Controller
public class StockController {
	
	@Autowired
	StockService stock_service;
	@Autowired
	ItemsDao items_dao;
	
	@RequestMapping("/admin/goods_stock_form.do")
	public String goods_stock_form(Model model, Integer i_no){
		
		Map map =null;
		map = stock_service.select_list();
		
		model.addAttribute("item_no",i_no);
		model.addAttribute("map",map);
		
		return"admin/goods_stock";
	}
	
	@RequestMapping("/admin/goods_stock_in.do")
	public String goods_stock_in(StockVo vo){
		
		int res = stock_service.insert_in_stock(vo);
		
		return "redirect:goods_stock_form.do";
	}
	
	@RequestMapping("/admin/goods_stock_out.do")
	public String goods_stock_out(StockVo vo){
		
		try {
			int res = stock_service.insert_out_stock(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:goods_stock_form.do";
	}
	
	@RequestMapping("/admin/goods_stock_delete.do")
	public String goods_stock_delete(StockVo vo){
		
		int res = stock_service.delete_stock_in(vo);
		
		return "redirect:goods_stock_form.do";
	}
	
	@RequestMapping("/admin/goods_stock_return")
	public String goods_stock_return(StockVo vo){
		
		int res = stock_service.delete_stock_out(vo);
		
		return "redirect:goods_stock_form.do";
	}
	
}
