package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.FaqDao;
import vo.FaqVo;

@Controller
public class FaqController {
	
	@Autowired
	FaqDao faq_dao;
	
	public FaqController() {
		// TODO Auto-generated constructor stub
	}
	
	
	@RequestMapping(value="/admin/faq_list.do")
	public String faq_list(Model model){
		List<FaqVo> f_list = faq_dao.select_list();
		
		model.addAttribute("f_list", f_list);
		
		return "admin/faq";
	}
}
