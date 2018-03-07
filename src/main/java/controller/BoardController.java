package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.BoardDao;
import util.Paging;
import vo.BoardVo;

@Controller
public class BoardController {
	/*	2018��3��7��(seo) 	*/
	@Autowired
	BoardDao board_dao;
	
	public BoardController() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 
	 * @param search
	 * @param search_text
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/board_list.do")
	public String BoardListAction(String search,String search_text,String page,Model model,HttpServletRequest request) {
		
		int nowPage = 1 ; // ���� ������ ������
		if(!(page==null || page.isEmpty()) ) {
			nowPage = Integer.parseInt(page);
		}
		int start = (nowPage-1)*common.Constant.Board.BLOCKLIST+1;
		int end = start + common.Constant.Board.BLOCKLIST-1;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		if(search!=null && !search.equals("all")) {
			
			if(search.equals("m_id_b_name_b_content")) {
				map.put("m_id", search_text);
				map.put("b_name", search_text);
				map.put("b_content", search_text);
			}else if(search.equals("m_id")) {
				map.put("m_id", search_text);
			}else if(search.equals("b_name")) {
				map.put("b_name", search_text);
			}else if(search.equals("b_content")) {
				map.put("b_content", search_text);
			}
		}
		List<BoardVo> list = board_dao.selectList(map);
		int rowTotal = board_dao.getRowTotal(map);
		
		
		//search_filter�����
		String search_filter="";
		if(search!=null) {				// search=name&search_text=�浿
			search_filter = String.format("search=%s&search_text=%s",
												 search,		search_text);
		}
		
		//PageMenu �����
		String pageMenu = Paging.getPaging("board_list.do", 
											nowPage, 
											search_filter,
											rowTotal, 
											common.Constant.Board.BLOCKLIST, 
											common.Constant.Board.BLOCKPAGE);
		
		/*request.getSession().removeAttribute("show");*/
		
		model.addAttribute("list",list);
		model.addAttribute("pageMenu",pageMenu);
		
		
		return common.ShortCut.Front.VIEW_PAHT+"board";
	}
	@RequestMapping(value="/board_insert_form.do")
	public String BoardInsertFormAction() {
		
		return common.ShortCut.Front.VIEW_PAHT+"board_insert";
		
	}
	/**
	 * 
	 * @param vo
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	/* Board.xml�� m_id �Է� sql���� �ִ°� ���Ŀ� �������Ѵ�. */
	@RequestMapping(value="/board_insert.do")
	public String BoardInsertAction(BoardVo vo,String page,Model model,HttpServletRequest request) {
		
		int res = board_dao.insert(vo);
		
		String b_ip = request.getRemoteAddr();
		vo.setB_ip(b_ip);
		
		model.addAttribute("page",page);
		
		return "redirect:board_list.do";
	}
	/*	2018��3��7��(seo)  */
	
}
