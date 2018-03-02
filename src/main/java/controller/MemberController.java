package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MemberDao;
import vo.MemberVo;



@Controller
public class MemberController {
	
	
	@Autowired
	MemberDao member_dao;
	
	@Autowired
	HttpServletRequest request;
	
	
	public MemberController() {
		// TODO Auto-generated constructor stub
	}
	
	
	@RequestMapping("/main/member_list.do")
	public String list(Model model){
		
		List<MemberVo> m_list = member_dao.select_list();
		
		model.addAttribute("m_list", m_list);
		
		return "main/bongsung";
		
	}
	
	/*@RequestMapping("/main/member_insert.do")*/
	
	@RequestMapping("/main/check_id.do")
	@ResponseBody
	public String check_id(Model model,String m_id){
		
		MemberVo vo = member_dao.selectOne(m_id);
		
		String result = "no";

		if(vo==null)
		 result ="yes";
		    
		    //���=> JSON�迭 ���� "[{'result':'yes'}]"        =>  {'result':'yes'}�̷��Ը� ������ �ν��� �� �ȵ�
		    String resultStr = String.format("[{'result':'%s'}]", result);
		    
		    //�������
		   /* response.getWriter().print(resultStr);*/
		
		return resultStr;
	}
	
	@RequestMapping("/main/member_insert.do")
	public String insert_id(MemberVo vo){
		
		String m_ip = request.getRemoteAddr();
		vo.setM_ip(m_ip);
		
		int res =member_dao.insert_id(vo);
		
		return "redirect:product_list.do";
	}

	
}
    
