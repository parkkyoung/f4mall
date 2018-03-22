package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.EvalDao;
import vo.EvalVo;

@Controller
public class EvalController {
	
	@Autowired
	EvalDao eval_dao;
	
	@Autowired
	HttpServletRequest request;
	
	public EvalController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping("/insert_eval.do")
	public String insert_eval(EvalVo vo){
		
		int res= 0;
		String eval_ip = request.getRemoteAddr();
		vo.setEval_ip(eval_ip);
		
		res = eval_dao.insert_eval(vo);
		
		return "";
	}
}
