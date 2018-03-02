package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.TestDao;
import vo.TestVo;

@Controller
public class TestController {
	
	@Autowired
	TestDao test_dao;
	
	public TestController() {
		// TODO Auto-generated constructor stub
	}

	@RequestMapping("main/product_list1.do")
	public String list(Model model){
		
		List<TestVo> list = test_dao.select_list();
		
		model.addAttribute("list",list);
		
		return "admin/goods_insert";
	}
}
