package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping("cart_insert.do")
	@ResponseBody
	public String cart_list(Integer p_no, String m_id){
		
		System.out.println("하이하이");
		
		String result = "fail";
		String resultStr = "";
		
		Map map = new HashMap();
		map.put("p_no", p_no);
		map.put("m_id", m_id);
		
		int res = cart_dao.cart_insert(map);
		
		System.out.println(res);
		
		if(res == 1){
			result = "success";
			resultStr = String.format("[{'result':'%s'}]", result);
			return resultStr;
		}
		
		resultStr = String.format("[{'result':'%s'}]", result);
		
		return resultStr;
	}
	
	
}