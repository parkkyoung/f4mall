package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ProductDao;
import vo.ProductVo;

@Controller
public class IndexController {
	
	@Autowired
	ProductDao product_dao;
	
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
