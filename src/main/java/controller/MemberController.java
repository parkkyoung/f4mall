package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import dao.MemberDao;
import vo.MemberVo;



@Controller
public class MemberController {
	
	
	@Autowired
	MemberDao member_dao;
	
	
	public MemberController() {
		// TODO Auto-generated constructor stub
	}
	
	
	@RequestMapping("/main/member_list.do")
	public String list(Model model){
		
		List<MemberVo> m_list = member_dao.select_list();
		
		model.addAttribute("m_list", m_list);
		
		return "main/bongsung";
		
	}
	
	@RequestMapping("/main/member_insert.do")
	
	
}
