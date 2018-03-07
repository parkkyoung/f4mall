package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.Constant;
import dao.FaqDao;
import vo.FaqVo;

@Controller
public class FaqController {
	
	@Autowired
	FaqDao faq_dao;
	
	public FaqController() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * admin faq ����Ʈ
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/admin/faq_list.do")
	public String faq_list(Model model){
		List<FaqVo> f_list = faq_dao.select_list();
		
		model.addAttribute("f_list", f_list);
		
		/*	2018��3��7��(seo) 	*/
		return common.ShortCut.Admin.ADMIN_VIEW_PATH+"faq";
		/*	//2018��3��7��(seo) 	*/
	}
	
	/**
	 * admin faq ��� �� �̵�
	 * @return
	 */
	@RequestMapping(value="/admin/faq_insert_form.do")
	public String faq_insert_form(){
		/*	2018��3��7��(seo) 	*/
		return common.ShortCut.Admin.ADMIN_VIEW_PATH+"faq_insert";
		/*	//2018��3��7��(seo) 	*/
	}
	
	/**
	 * admin faq ���
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/admin/faq_insert.do")
	public String faq_insert(FaqVo vo, HttpServletRequest request){
		
		// ����� ip
		String f_ip = request.getRemoteAddr();
		vo.setF_ip(f_ip);
		
		// ������ ���� ���÷��̽�
		String f_content = vo.getF_content().replace("\n", "<br />");
		vo.setF_content(f_content);
		
		int res = faq_dao.insert(vo);
		return "redirect:faq_list.do";
	}
	
	/**
	 * admin faq ����
	 * @param f_no
	 * @return
	 */
	@RequestMapping(value="/admin/faq_delete.do")
	public String faq_delete(Integer f_no){
		int res = faq_dao.delete(f_no);
		return "redirect:faq_list.do";
	}

	/**
	 * admin faq ���� ������ �̵�
	 * @param model
	 * @param f_no
	 * @return
	 */
	@RequestMapping(value="/admin/faq_update_form.do")
	public String faq_update_form(Model model, Integer f_no){
		
		FaqVo vo = faq_dao.select_one(f_no);
		String f_content = vo.getF_content().replace("<br />", "\n");
		vo.setF_content(f_content);
		
		model.addAttribute("vo", vo);
		/*	2018��3��7��(seo) 	*/
		return common.ShortCut.Admin.ADMIN_VIEW_PATH+"faq_update";
		/*	//2018��3��7��(seo) 	*/
	}
	
	/**
	 * admin faq ����
	 * @param vo
	 * @return
	 */
	@RequestMapping(value="/admin/faq_update.do")
	public String faq_update(FaqVo vo){
		
		// ������ ���� ���÷��̽�
		String f_content = vo.getF_content().replace("\n", "<br />");
		vo.setF_content(f_content);

		int res = faq_dao.update(vo);
		return "redirect:faq_list.do";
	}
	
	/**
	 * front faq ���
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/faq.do")
	public String faq(Model model){
		List<FaqVo> f_list = faq_dao.select_list();
		
		model.addAttribute("f_list", f_list);
		/*	2018��3��7��(seo) 	*/
		return common.ShortCut.Admin.ADMIN_VIEW_PATH+"faq";
		/*	//2018��3��7��(seo) 	*/
	}
}