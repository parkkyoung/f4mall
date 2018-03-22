package controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		return "redirect:items_view.do";
	}
	
	@RequestMapping("/eval_one.do")
	@ResponseBody
	public String eval_one(int eval_no){
		
		EvalVo vo = null;
		
		vo = eval_dao.select_one(eval_no);
		System.out.println("≈∏¿Ã∆≤ : "+vo.getEval_title());
		System.out.println("ƒ¡≈Ÿ√˜ : "+vo.getEval_content());
		
		String resultStr;
		resultStr = String.format("[{'eval_title' : '%s', 'eval_content' : '%s'}]", vo.getEval_title(), vo.getEval_content());
		
		return resultStr;
	}
}
