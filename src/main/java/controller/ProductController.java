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
		
		// vo 포장
		ProductVo vo = new ProductVo();
		List<ProductVo> p_list = product_dao.select_list();
		model.addAttribute("p_list", p_list);
		
		return common.ShortCut.Front.VIEW_PATH+"goods";
	}
	
	
	@RequestMapping("product_view.do")
	public String product_view(Model model, Integer p_no) {
		
		// p_no를 기준으로 vo 포장
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
		
		// vo 포장
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
		
		// 등록 폼으로 이동
		return common.ShortCut.Admin.ADMIN_VIEW_PATH+"goods_insert";
	}
	
	
	/**
	 * 어드민 등록
	 * @param vo
	 * @return
	 */
	@RequestMapping("/admin/goods_insert.do")
	public String product_insert(ProductVo vo,Model model){
		
		// vo 포장해서 db 삽입
		int res = product_dao.insert_product(vo);
		
		// 상세로 넘어갈때 파라미터로 넘길 상품번호
		int p_no = product_dao.selectMaxNo();
		model.addAttribute("p_no",p_no);
		
		// 등록한 상품 기준 상세페이지로 이동
		return "redirect:goods_update_form.do";
	}
	
	/**
	 * 어드민 상세(수정)
	 * @param model
	 * @param p_no
	 * @return
	 */
	@RequestMapping("/admin/goods_update_form.do")
	public String product_update_form(Model model,int p_no){

		// 옵션별 포린 리스트 불러오기
		/*List<CategoryVo> category = product_dao.category();
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
		model.addAttribute("size", size);*/
		
		// 기존 값들을 뿌려줄 vo 포장
		ProductVo vo = new ProductVo();
		vo = product_dao.select_one(p_no);
		model.addAttribute("vo", vo);
		
		return common.ShortCut.Admin.ADMIN_VIEW_PATH+"goods_update";
	}
	
	/**
	 * 상품 수정
	 * @param vo
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/goods_update.do")
	public String product_update(ProductVo vo, Model model){
		
		// 수정 vo를 db에 업데이트
		int res = product_dao.update_product(vo);
		
		// 상세로 넘어갈때 파라미터로 넘길 상품번호
		int p_no = product_dao.selectMaxNo();
		model.addAttribute("p_no",p_no);
		
		// 수정된 상품 상세페이지로 이동
		return "redirect:goods_update_form.do";
	}
	
	/**
	 * 상품 삭제
	 * @param p_no
	 * @return
	 */
	@RequestMapping("/admin/product_delete.do")
	public String product_delete(int p_no){
		
		// p_no를 기준으로 상품 삭제
		int res = product_dao.delete_product(p_no);
		
		// 리스트 페이지로 이동
		return "redirect:goods_list.do";
	}
	
	
	
}
