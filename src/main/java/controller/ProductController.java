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
	
	@RequestMapping("/product_list.do")
	public String product_list(Model model){
		
		List<ProductVo> p_list = product_dao.select_list();
		
		model.addAttribute("p_list",p_list);
		
		return "front/main";
	}
	
	@RequestMapping("/admin/product_insert_form.do")
	public String product_insert_form(){
		
		return "admin/goods_insert";
	}
	
	@RequestMapping("/product_insert.do")
	public String product_insert(ProductVo vo){
		
		int res = product_dao.insert_product(vo);
		
		return "redirect:product_list.do";
	}
	
	@RequestMapping("/admin/product_delete.do")
	public String product_delete(ProductVo vo){
		
		int res = product_dao.delete_product(vo);
		
		return "redirect:product_list.do";
	}
	
	@RequestMapping("product_view.do")
	public String product_view(Model model, Integer p_no) {
		
	System.out.println("파라미터 받기p_no:"+ p_no);
		
		ProductVo vo = product_dao.select_one(p_no);
		
		System.out.println("dao에서 넘어온vo:" + vo);
		
		model.addAttribute("vo",vo);
		
		return "front/goods_view";
	}
	
	
	
}
