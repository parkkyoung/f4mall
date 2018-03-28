package controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.EvalDao;
import dao.ItemsDao;
import service.StockService;
import vo.EvalVo;
import vo.ItemsArrayVo;
import vo.ItemsViewVo;
import vo.ItemsVo;
import vo.ProductVo;
import vo.StockVo;

@Controller
public class ItemsController {
	
	@Autowired
	ItemsDao items_dao;
	
	@Autowired
	EvalDao eval_dao;
	
	@Autowired
	StockService stock_service;

	@Autowired
	HttpServletRequest request;
	
	
	public ItemsController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping("admin/items_insert.do")
	public String items_insert(Model model, ItemsArrayVo avo, int s_amt){
		
		ItemsVo vo = new ItemsVo();
		vo.setP_no(avo.getP_no());
		vo.setCategory_no(avo.getCategory_no());
		vo.setSex_no(avo.getSex_no());
		vo.setBrand_no(avo.getBrand_no());
		vo.setMaterial_no(avo.getMaterial_no());
		
		StockVo stock_vo = new StockVo();
		
		
		// size 갯수 * color 갯수 만큼 db에 삽입
		for(int i=0;i<avo.getSize_no().length;i++){
			for(int k=0;k<avo.getColor_no().length;k++){
				vo.setSize_no(avo.getSize_no()[i]);
				vo.setColor_no(avo.getColor_no()[k]);
				int res = items_dao.insert_items(vo);
				int i_no = items_dao.get_i_no();
				stock_vo.setI_no(i_no);
				stock_vo.setS_amt(s_amt);
				int stock_res = stock_service.insert_in_stock2(stock_vo);
			}
		}
		
		
		
		// 상세로 넘어갈때 파라미터로 넘길 상품번호
		model.addAttribute("p_no",vo.getP_no());
		
		return "redirect:goods_update_form.do";
	}
	
	/**
	 * 아이템 삭제
	 * @param model
	 * @param i_no
	 * @param p_no
	 * @return
	 */
	@RequestMapping("admin/items_delete.do")
	public String items_delete(Model model, int i_no, int p_no){
		
		System.out.println("아이템 번호 : "+i_no+"\n상품 번호 : "+p_no);
		
		// i_no를 기준으로 아이템 삭제
		int res = items_dao.delete_items(i_no);
		
		// 상세로 넘어갈때 파라미터로 넘길 상품번호
		model.addAttribute("p_no",p_no);
		
		return "redirect:goods_update_form.do";
	}
	
	@RequestMapping("items_view.do")
	public String items_view(Integer p_no, Model model, String m_id){
		
		Map map = new HashMap();
		map.put("m_id", m_id);
		map.put("p_no", p_no);
		
		ProductVo vo = items_dao.select_one_view(p_no);
		List<EvalVo> items_eval = items_dao.select_eval(p_no);
		List<ItemsViewVo> items_option = items_dao.select_option(p_no);
		List<EvalVo> possible_eval = eval_dao.possible_eval(map);
<<<<<<< HEAD
		double avg_score = Math.round(eval_dao.eval_total(p_no));
=======
		String avg_score = eval_dao.eval_total(p_no);
		
>>>>>>> branch 'master' of https://github.com/parkkyoung/f4mall

		model.addAttribute("vo",vo);
		model.addAttribute("items_eval",items_eval);
		model.addAttribute("items_option",items_option);
		model.addAttribute("possible_eval",possible_eval);
		model.addAttribute("avg_score",avg_score);
<<<<<<< HEAD
		
=======
>>>>>>> branch 'master' of https://github.com/parkkyoung/f4mall
		return "front/goods_view";
	}
	
	@RequestMapping("check_stock.do")
	@ResponseBody
	public String check_stock(Integer cart_amt, Integer i_no, Model model){
		
		String result = "fail";
		String resultStr = "";
		ItemsViewVo vo = items_dao.stock_check(i_no);
		
		if(vo.getS_amt() < cart_amt){
			result = "fail";
		}else{
			result = "success";
		}
		
		resultStr = String.format("[{'result':'%s'}]", result); 
		
		return resultStr;
	}
	
}
