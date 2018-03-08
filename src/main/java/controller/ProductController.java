package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ProductDao;
import vo.ProductVo;
import vo.option.BrandVo;
import vo.option.CategoryVo;
import vo.option.ColorVo;
import vo.option.MaterialVo;
import vo.option.SexVo;
import vo.option.SizeVo;

@Controller
public class ProductController {
	
	@Autowired
	ProductDao product_dao;
	
	public ProductController() {
		// TODO Auto-generated constructor stub
	}
	
	
	/**
	 * 프론트 상품목록
	 * @param model
	 * @return
	 */
	@RequestMapping("/product_list.do")
	public String product_list(Model model){
		
		ProductVo vo = new ProductVo();
		
		List<ProductVo> p_list = product_dao.select_list();
		
		model.addAttribute("p_list", p_list);
		
		return common.ShortCut.Front.VIEW_PATH+"goods";
	}
	
	@RequestMapping("product_view.do")
	public String product_view(Model model, Integer p_no) {
		
		ProductVo vo = product_dao.select_one(p_no);
		
		model.addAttribute("vo",vo);
		
		return "front/goods_view";
	}
	
	/**
	 * 어드민 상품목록
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/goods_list.do")
	public String product_list_admin(Model model){
		
		ProductVo vo = new ProductVo();
		
		List<ProductVo> p_list = product_dao.select_list();
		
		model.addAttribute("p_list", p_list);
		
		return common.ShortCut.Admin.ADMIN_VIEW_PATH+"goods";
	}
	
	/**
	 * 어드민 등록 폼
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/goods_insert_form.do")
	public String product_insert_form(Model model){
		
		// 옵션별 포린 리스트 불러오기
		List<CategoryVo> category = product_dao.category();
		List<MaterialVo> material = product_dao.material();
		List<ColorVo> color = product_dao.color();
		List<SexVo> sex = product_dao.sex();
		List<BrandVo> brand= product_dao.brand();
		List<SizeVo> size = product_dao.size();

		model.addAttribute("category", category);
		model.addAttribute("material", material);
		model.addAttribute("color", color);
		model.addAttribute("sex", sex);
		model.addAttribute("brand", brand);
		model.addAttribute("size", size);
		
		return common.ShortCut.Admin.ADMIN_VIEW_PATH+"goods_insert";
	}
	
	
	/**
	 * 어드민 등록
	 * @param vo
	 * @return
	 */
	@RequestMapping("/admin/goods_insert.do")
	public String product_insert(ProductVo vo){
		
		int res = product_dao.insert_product(vo);
		
		return "redirect:goods_list.do";
	}
	
	
	@RequestMapping("/admin/goods_update_form.do")
	public String product_update_form(Model model,int p_no){

		// 옵션별 포린 리스트 불러오기
		List<CategoryVo> category = product_dao.category();
		List<MaterialVo> material = product_dao.material();
		List<ColorVo> color = product_dao.color();
		List<SexVo> sex = product_dao.sex();
		List<BrandVo> brand= product_dao.brand();
		List<SizeVo> size = product_dao.size();

		model.addAttribute("category", category);
		model.addAttribute("material", material);
		model.addAttribute("color", color);
		model.addAttribute("sex", sex);
		model.addAttribute("brand", brand);
		model.addAttribute("size", size);
		
		ProductVo vo = new ProductVo();
		vo = product_dao.select_one(p_no);
		
		model.addAttribute("vo", vo);
		
		return common.ShortCut.Admin.ADMIN_VIEW_PATH+"goods_update";
	}
	
	
	
	@RequestMapping("/admin/product_delete.do")
	public String product_delete(ProductVo vo){
		
		int res = product_dao.delete_product(vo);
		
		return "redirect:product_list.do";
	}
	
	
	
}
