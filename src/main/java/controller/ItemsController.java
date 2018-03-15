package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ItemsDao;
import vo.ItemsArrayVo;
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
	
	@RequestMapping("admin/items_insert.do")
	public String items_insert(Model model, ItemsArrayVo avo){
		
		ItemsVo vo = new ItemsVo();
		vo.setP_no(avo.getP_no());
		vo.setS_no(avo.getS_no());
		vo.setCategory_no(avo.getCategory_no());
		vo.setSex_no(avo.getSex_no());
		vo.setBrand_no(avo.getBrand_no());
		vo.setMaterial_no(avo.getMaterial_no());
		
		// size 갯수 * color 갯수 만큼 db에 삽입
		for(int i=0;i<avo.getSize_no().length;i++){
			for(int k=0;k<avo.getColor_no().length;k++){
				vo.setSize_no(avo.getSize_no()[i]);
				vo.setColor_no(avo.getColor_no()[k]);
				int res = items_dao.insert_items(vo);
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
	public String items_view(Integer p_no, Model model){
		
		ProductVo vo = items_dao.select_one_view(p_no);
		List<ItemsViewVo> items_list = items_dao.items_list(p_no);
		
		model.addAttribute("vo",vo);
		model.addAttribute("items_list",items_list);
		
		return "front/goods_view";
	}
	
}
