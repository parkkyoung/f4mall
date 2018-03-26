package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.CartDao;
import dao.ProductDao;
import vo.CartVo;
import vo.MemberVo;
import vo.ProductVo;

@Controller
public class CartController {
	
	@Autowired
	CartDao cart_dao;
	
	public CartController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping("/cart_insert.do")
	@ResponseBody
	public String cart_insert(Integer i_no, String m_id, Integer cart_amt, HttpServletRequest request){
		
		String result = "fail";
		String resultStr = "";
		
		Map map = new HashMap();
		map.put("i_no", i_no);
		map.put("m_id", m_id);
		map.put("cart_amt", cart_amt);
		
		CartVo vo = cart_dao.select_one(map);
		
		if(vo == null){
			int res = cart_dao.cart_insert(map);
			result = "success";
		}
		
		resultStr = String.format("[{'result':'%s'}]", result);
		
		// 技记俊 历厘
		HttpSession session = request.getSession();
		session.removeAttribute("header_cart_list");
		MemberVo user = (MemberVo) session.getAttribute("user");
		List<CartVo> cart_list = cart_dao.select_list(user.getM_id());
		session.setAttribute("header_cart_list",cart_list);
		
		return resultStr;
	}
	
	@RequestMapping("/cart_view.do")
	public String cart_list(Model model, String m_id){

		List<CartVo> c_view = cart_dao.select_list(m_id);
		
		model.addAttribute("c_view",c_view);
		
		return "front/cart_list";
	}
	
	@RequestMapping("/delete_cart.do")
	@ResponseBody
	public String delete_cart(int cart_no, HttpServletRequest request){
		
		int res = cart_dao.cart_delete(cart_no);
		
		String resultStr = "";
		String result = "yes";
		
		// 技记 昏力
		HttpSession session = request.getSession();
		session.removeAttribute("header_cart_list");
		
		resultStr = String.format("[{'result':'%s'}]", result);
		return resultStr;
	}
	
	@RequestMapping("/update_cart.do")
	public String update_cart(Model model,Integer i_no, String m_id, Integer cart_amt){
		
		System.out.println(cart_amt);
		
		Map map = new HashMap();
		map.put("i_no", i_no);
		map.put("m_id", m_id);
		map.put("cart_amt", cart_amt);
		
		int res = cart_dao.update_cart(map);
		
		model.addAttribute("m_id",m_id);
		
		return "redirect:cart_view.do";
	}
	
	
}