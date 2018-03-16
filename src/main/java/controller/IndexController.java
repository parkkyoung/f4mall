package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CartDao;
import dao.ProductDao;
import vo.CartVo;
import vo.MemberVo;
import vo.ProductVo;

@Controller
public class IndexController {
	
	@Autowired
	ProductDao product_dao;
	
	@Autowired
	HttpServletRequest request;
	
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
		
		List<ProductVo> p_list = product_dao.select_list();
		
		model.addAttribute("p_list",p_list);
		
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
