package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.BoardDao;
import util.Paging;
import vo.BoardVo;

@Controller
public class BoardController {
	
	@Autowired
	BoardDao board_dao;
	
	public BoardController() {
		// TODO Auto-generated constructor stub
	}
	
	
	@RequestMapping("/board/list.do")
	public String BoardListAction(String search,String search_text,String page,Model model,HttpServletRequest request) {
		
		int nowPage = 1 ; //현재 보여질 페이지
		if(!(page==null || page.isEmpty())) {
			nowPage = Integer.parseInt(page);
		}
		int start = (nowPage-1)*common.Constant.Board.BLOCKLIST+1;
		int end = start + common.Constant.Board.BLOCKLIST-1;
		
		Map map = new HashedMap();
		map.put("start", start);
		map.put("end", end);
		
		if(search.equals("name_subject_content")) {
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
		
		List<BoardVo> list = board_dao.selectList(map);
		
		int rowTotal = board_dao.getRowTotal(map);
		
		//search_filter만들기
		String search_filter="";
		if(search!=null) {
			search_filter = String.format("search=%s%search_test=%s", search, search_text);
			
		}
		//PageMenu 만들기
				String pageMenu = Paging.getPaging("list.do", 
													nowPage, 
													search_filter,
													rowTotal, 
													common.Constant.Board.BLOCKLIST,
													common.Constant.Board.BLOCKPAGE);
				
				request.getSession().removeAttribute("show");
				
				model.addAttribute("list",list);
				model.addAttribute("pageMenu",pageMenu);
		
		
		
		
		return common.ShortCut.Board.VIEW_PAHT+"board_list";
	}
	@RequestMapping("/board/delete.do")
	public String BoardDeleteAction(BoardVo vo,String page,Model model) {
		
		int b_no = vo.getB_no();
		vo = board_dao.selectOne(b_no);
		
		return "redirect:list.do";
	}
	@RequestMapping("/board/insert_form.do")
	public String BoardInsertFormAction() {
		
		return common.ShortCut.Board.VIEW_PAHT+"board_insert_form";
	}
	@RequestMapping("/board/insert.do")
	public String BoardInsertAction(BoardVo vo,String page,Model model) {
		
		int res= board_dao.insert(vo);
		model.addAttribute("page",page);
		return "redirect:list.do";
	}
	@RequestMapping("/board/update.do")
	public String BoardUpdateAction(BoardVo vo,Model model,HttpServletRequest request,String page,String search,String search_text) throws IOException {
		
		String b_ip = request.getRemoteAddr();
		vo.setB_ip(b_ip);
		
		int res = board_dao.update(vo);
		model.addAttribute("page",page);
		model.addAttribute("search",search);
		model.addAttribute("search_text",search_text);
		
		return "redirect:list.do";
	}
	@RequestMapping("/board/reply_form.do")
	public String BoardReplyFormAction() {
		
		return common.ShortCut.Board.VIEW_PAHT+"board_reply_form";
	}
	@RequestMapping("/board/reply.do")
	public String BoardReplyAction(Model model,Integer page,BoardVo vo,HttpServletRequest request) {
		int b_no = vo.getB_no();
		String b_ip = request.getRemoteAddr();
		vo.setB_ip(b_ip);
		
		BoardDao dao = board_dao;
		
		BoardVo baseVo = dao.selectOne(b_no);
		
		int res = dao.update_step(baseVo);
		
		//답글의 ref,step,depth를 설정
		vo.setB_ref(baseVo.getB_ref());
		vo.setB_step(baseVo.getB_step()+1);
		vo.setB_depth(baseVo.getB_depth()+1);
		
		res = dao.reply(vo);
		
		if(baseVo.getNo()%common.Constant.Board.BLOCKLIST==0) 
			page++;
		
		model.addAttribute("page",page);
		
		return "redirect:list.do";
	
	}
	@RequestMapping("/board/view.do")
	public String BoardViewAction(Model model,BoardVo vo,HttpServletRequest request) {
		int b_no = vo.getB_no();
		
		 vo = board_dao.selectOne(b_no);
		
		HttpSession session = request.getSession();
		
		Object show = session.getAttribute("show");
		
		if(show==null) { //처음이냐?
			int res = board_dao.updateHit(b_no);
			
			session.setAttribute("show", true);
		}
		
		model.addAttribute("vo", vo);
		
		return common.ShortCut.Board.VIEW_PAHT+"board_view";
	}

}
