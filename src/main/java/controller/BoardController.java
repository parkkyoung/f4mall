package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	
	// �Խñ� ����Ʈ.
	/**
	 * 
	 * @param search_text
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/board_list.do")
	public String BoardListAction(String search_text,String page,Model model,HttpServletRequest request) {
		
		int nowPage = 1 ; // ���� ������ ������
		if(!(page==null || page.isEmpty()) ) {
			nowPage = Integer.parseInt(page);
		}
		int start = (nowPage-1)*common.Constant.Board.BLOCKLIST+1;
		int end = start + common.Constant.Board.BLOCKLIST-1;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		if(search_text !=null) {
			
			map.put("m_id", search_text);
			map.put("b_name", search_text);
			map.put("b_content", search_text);
		}
		List<BoardVo> list = board_dao.selectList(map);
		int rowTotal = board_dao.getRowTotal(map);
			
		//search_filter�����
		String search_filter="";
		
		//PageMenu �����
		String pageMenu = Paging.getPaging("board_list.do", 
											nowPage, 
											rowTotal, 
											common.Constant.Board.BLOCKLIST, 
											common.Constant.Board.BLOCKPAGE);
		
		//readhit+1�� ���� show
		request.getSession().removeAttribute("show");
		
		model.addAttribute("list",list);
		model.addAttribute("pageMenu",pageMenu);
		
		
		return common.ShortCut.Front.VIEW_PATH+"board";
	}
	@RequestMapping(value="/board_insert_form.do")
	public String BoardInsertFormAction() {
		
		return common.ShortCut.Front.VIEW_PATH+"board_insert";
		
	}
	
	// �Խñ� ����
	/**
	 * 
	 * @param vo
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/board_insert.do")
	public String BoardInsertAction(BoardVo vo,String page,Model model,HttpServletRequest request) {
		
		String b_ip = request.getRemoteAddr();
		vo.setB_ip(b_ip);
		
		int res = board_dao.insert(vo);
		
		model.addAttribute("page",page);
		
		return "redirect:board_list.do";
	}
	
	
	//�Խñ� ����
	/**
	 * 
	 * @param model
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/board_view.do")
	public String BoardViewAction(Model model,BoardVo vo,HttpServletRequest request) {
		int b_no = vo.getB_no();
		
		 vo = board_dao.selectOne(b_no);
		
		HttpSession session = request.getSession();
		
		Object show = session.getAttribute("show");
		
		if(show==null) { //ó���̳�?
			int res = board_dao.updateHit(b_no);
			
			session.setAttribute("show", true);
		}
		
		model.addAttribute("vo", vo);
		
		return common.ShortCut.Front.VIEW_PATH+"board_view";
	}
	
	//�Խñ� ����
	/**
	 * 
	 * @param vo
	 * @param page
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/board_delete.do")
	public String BoardDeleteAction(BoardVo vo,String page,Model model) {
		
		int b_no = vo.getB_no();
		vo = board_dao.selectOne(b_no);
		
		int res = board_dao.delete(b_no);
		model.addAttribute("page",page);
		
		return "redirect:board_list.do";
	}
	
	//�Խñ� ������Ʈ ��
	/**
	 * 
	 * @param vo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/board_update_form.do")
	public String BoardUpdateFormAction(BoardVo vo,Model model) {
		
		int b_no = vo.getB_no();
		
		vo = board_dao.selectOne(b_no);
		
		model.addAttribute("vo",vo);
		
		return common.ShortCut.Front.VIEW_PATH+"board_update";
	}
	
	//�Խñ� ������Ʈ
	/**
	 * 
	 * @param vo
	 * @param model
	 * @param request
	 * @param page
	 * @param search
	 * @param search_text
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/board_update.do")
	public String BoardUpdateAction(BoardVo vo,Model model,HttpServletRequest request,String page,String search,String search_text) throws IOException {
		
		String b_ip = request.getRemoteAddr();
		vo.setB_ip(b_ip);
		
		int res = board_dao.update(vo);
		model.addAttribute("page",page);
		model.addAttribute("search",search);
		model.addAttribute("search_text",search_text);
		
		return "redirect:board_list.do";
	}
	
	//��� ��
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="/board_reply_form.do")
	public String BoardReplyFormAction() {
		
		return common.ShortCut.Front.VIEW_PATH+"board_reply";
	}
	
	//���
	/**
	 * 
	 * @param model
	 * @param page
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/board_reply.do")
	public String BoardReplyAction(Model model,Integer page,BoardVo vo,HttpServletRequest request) {
		int b_no = vo.getB_no();
		String b_ip = request.getRemoteAddr();
		vo.setB_ip(b_ip);
		
		BoardDao dao = board_dao;
		
		BoardVo baseVo = dao.selectOne(b_no);
		
		
		//����� ref,step,depth�� ����
		vo.setB_ref(baseVo.getB_ref());
		vo.setB_step(baseVo.getB_step()+1);
		vo.setB_depth(baseVo.getB_depth()+1);
		
		int res = dao.update_step(baseVo);
		
		
		
		res = dao.reply(vo);
		
		if(baseVo.getNo()%common.Constant.Board.BLOCKLIST==0) 
			page++;
		
		model.addAttribute("page",page);
		
		return "redirect:board_list.do";
	
	}
}