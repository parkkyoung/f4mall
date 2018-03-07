package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	
	/**
	 * @param model
	 * @return
	 */
	@RequestMapping("/member_list.do")
	public String list(Model model){
		
		List<MemberVo> m_list = member_dao.select_list();
		
		model.addAttribute("m_list", m_list);
		
		return "front/bongsung";
		
	}
	
	/*@RequestMapping("/main/member_insert.do")*/
	
	/**
	 * @param model
	 * @param m_id
	 * @param pwd
	 * @return
	 */
	@RequestMapping("/check_id.do")
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
	
	
	/**
	 * @return
	 */
	@RequestMapping("/member_join_clause.do")
	public String member_join_clause(){
		
		return "front/join";
	}
	
	
	/**
	 * @return
	 */
	@RequestMapping("/member_join_form.do")
	public String member_join_form(){
		
		return "front/join2";
	}
	
	
	/**
	 * @return
	 */
	@RequestMapping("/member_insert.do")
	public String insert_id(MemberVo vo){
		
		String m_ip = request.getRemoteAddr();
		vo.setM_ip(m_ip);
		
		int res =member_dao.insert_id(vo);
		
		return "redirect:product_list.do";
	}
	
	
	/**
	 * @param m_id
	 * @param m_pwd
	 * @param request
	 * @return
	 */
	@RequestMapping("/login.do")
	@ResponseBody
	public String Login(String m_id, String m_pwd,HttpServletRequest request) {

		MemberVo user = member_dao.selectOne(m_id);

		String result="no";
		String resultStr ="";// String.format("[{'result':'%s'}]", result);
		// 아이디 틀린경우
		if (user == null) {
			result ="id_fail";
			resultStr = String.format("[{'result':'%s'}]", result);
			return resultStr;	
		}

		// 비밀번호가 틀린경우
		if (user.getM_pwd().equals(m_pwd) == false) {
			result = "pwd_fail";
			resultStr = String.format("[{'result':'%s'}]", result);
			return resultStr;
		}

			// 로그인정보를 세션에 저장
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		result = "yes";
		resultStr = String.format("[{'result':'%s'}]", result);
		

		return resultStr;

	}
	
	
	/**
	 * @param vo
	 * @return
	 */
	@RequestMapping("/logout.do")
	public String logout(MemberVo vo){
		
		System.out.println("로그아웃");
		
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		
		return "redirect:product_list.do";
	}
	
	

}
    

