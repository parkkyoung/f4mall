package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CartDao;
import dao.MainDao;
import dao.ProductDao;
import vo.CartVo;
import vo.MemberVo;
import vo.ProductVo;

@Controller
public class IndexController {
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	ProductDao product_dao;
	
	@Autowired
	MainDao main_dao;
	
	@Autowired
	CartDao cart_dao;
	
	public IndexController() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 프론트 메인
	 * @param model
	 * @return
	 */
	@RequestMapping("/index.do")
	public String main(Model model){
		
		// 브랜드별 상품리스트 불러오기
		List<ProductVo> list01 = main_dao.main_list01();
		List<ProductVo> list02 = main_dao.main_list02();
		List<ProductVo> list03 = main_dao.main_list03();
		List<ProductVo> list04 = main_dao.main_list04();
		List<ProductVo> list05 = main_dao.main_list05();
		List<ProductVo> list06 = main_dao.main_list06();
		List<ProductVo> list07 = main_dao.main_list07();
		List<ProductVo> list08 = main_dao.main_list08();
		List<ProductVo> list09 = main_dao.main_list09();

		model.addAttribute("list01", list01);
		model.addAttribute("list02", list02);
		model.addAttribute("list03", list03);
		model.addAttribute("list04", list04);
		model.addAttribute("list05", list05);
		model.addAttribute("list06", list06);
		model.addAttribute("list07", list07);
		model.addAttribute("list08", list08);
		model.addAttribute("list09", list09);
		
		// 로그인 세션 저장 및 카트 불러오기
		HttpSession session = request.getSession();
		MemberVo user = (MemberVo)session.getAttribute("user");
		if(user!=null){
			List<CartVo> cart_list = cart_dao.select_list(user.getM_id());
			model.addAttribute("header_cart_list",cart_list);
		}
		
		return "front/main";
	}
	
	/**
	 * 어드민 메인
	 * @return
	 */
	@RequestMapping("/admin/index.do")
	public String main(){
		return "admin/index";
	}
}
