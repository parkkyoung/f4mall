package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CartDao;
import dao.DemandDao;
import dao.GraphDao;
import dao.MainDao;
import dao.ProductDao;
import vo.CartVo;
import vo.DemandVo;
import vo.MemberVo;
import vo.ProductVo;
import vo.graph.GraphAddrVo;
import vo.graph.GraphCategoryVo;

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
	
	@Autowired
	DemandDao demand_dao;
	
	@Autowired
	GraphDao graph_dao;
	
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
			/*model.addAttribute("demand_eval",demand_eval);*/
		}
		
		return "front/main";
	}
	
	/**
	 * 어드민 메인
	 * @return
	 */
	@RequestMapping("/admin/index.do")
	public String admin_main(Model model){
		
		// 데이터를 저장할 맵
		Map map = new HashMap();
		
		// 최근 1달 주문, 상품평, 회원가입 수, 상품등록 수
		int count_demand = graph_dao.count_demand();
		int count_eval = graph_dao.count_eval();
		int count_member = graph_dao.count_member();
		int count_product = graph_dao.count_product();
		map.put("count_demand", count_demand);
		map.put("count_eval", count_eval);
		map.put("count_member", count_member);
		map.put("count_product", count_product);
		
		// 지역별 통계
		GraphAddrVo addr01 = graph_dao.count_addr01();
		GraphAddrVo addr02 = graph_dao.count_addr02();
		GraphAddrVo addr03 = graph_dao.count_addr03();
		map.put("addr01", addr01);
		map.put("addr02", addr02);
		map.put("addr03", addr03);
		
		// 카테고리별 주문통계
		GraphCategoryVo category01 = graph_dao.count_category01();
		GraphCategoryVo category02 = graph_dao.count_category02();
		GraphCategoryVo category03 = graph_dao.count_category03();
		map.put("category01", category01);
		map.put("category02", category02);
		map.put("category03", category03);
		
		// 성별 주문통계
		GraphCategoryVo sex01 = graph_dao.count_sex01();
		GraphCategoryVo sex02 = graph_dao.count_sex02();
		GraphCategoryVo sex03 = graph_dao.count_sex03();
		map.put("sex01", sex01);
		map.put("sex02", sex02);
		map.put("sex03", sex03);

		// 브랜드별 주문통계
		GraphCategoryVo brand01 = graph_dao.count_brand01();
		GraphCategoryVo brand02 = graph_dao.count_brand02();
		GraphCategoryVo brand03 = graph_dao.count_brand03();
		map.put("brand01", brand01);
		map.put("brand02", brand02);
		map.put("brand03", brand03);
		
		// 맵 어트리뷰트
		model.addAttribute("map", map);
		
		return "admin/index";
	}
}
