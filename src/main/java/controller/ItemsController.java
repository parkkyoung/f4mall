package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ItemsDao;
import vo.ItemsViewVo;
import vo.ItemsVo;
import vo.ProductVo;

@Controller
public class ItemsController {
	
	@Autowired
	ItemsDao items_dao;
	
	public ItemsController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping("items_view.do")
	public String items_view(Integer p_no, Model model){
		
		ProductVo vo = items_dao.select_one_view(p_no);
		List<ItemsViewVo> items_list = items_dao.items_list(p_no);
		
		model.addAttribute("vo",vo);
		model.addAttribute("items_list",items_list);
		
		return "front/goods_view";
	}
	
}
