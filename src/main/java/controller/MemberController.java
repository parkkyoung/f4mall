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
	public String check_id(Model model,String m_id,String pwd){
		
		// ID체크
		MemberVo vo = member_dao.selectOne(m_id);
		
		String result = "no";

		if(vo==null)
		 result ="yes";
		    
		    //결과=> JSON배열 포장 "[{'result':'yes'}]"        =>  {'result':'yes'}이렇게만 보내면 인식이 잘 안됨
		    String resultStr = String.format("[{'result':'%s'}]", result);
		    
		    //결과정송
		   /* response.getWriter().print(resultStr);*/
			//System.out.println(resultStr);
		
		return resultStr;
	}
	
	
	

}
    

