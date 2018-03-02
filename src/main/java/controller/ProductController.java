package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ProductDao;
import vo.ProductVo;

@Controller
public class ProductController {
	
	@Autowired
	ProductDao product_dao;
	
	public ProductController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping("main/product_list.do")
	public String product_list(Model model){
		
		List<ProductVo> p_list = product_dao.select_list();
		
		model.addAttribute("p_list",p_list);
		
		return "main/main";
	}
	
	@RequestMapping("admin/product_insert_form.do")
	public String product_insert_form(){
		
		return "admin/goods_insert";
	}
	
	@RequestMapping("main/product_insert.do")
	public String product_insert(ProductVo vo){
		
		int res = product_dao.insert_product(vo);
		
		return "redirect:product_list.do";
	}
	
	@RequestMapping("admin/product_delete.do")
	public String product_delete(ProductVo vo){
		
		int res = product_dao.delete_product(vo);
		
		return "redirect:product_list.do";
	}
	
	
	
}
