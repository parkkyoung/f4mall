package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProfileController {
	public ProfileController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping("/profile.do")
	public String product_insert_form(Model model){
		
		// ��� ������ �̵�
		return common.ShortCut.Front.VIEW_PATH+"profile";
	}
}
