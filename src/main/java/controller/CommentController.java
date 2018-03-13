package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.CommentDao;
import util.Paging;
import vo.CommentVo;

@Controller
public class CommentController {
	
	@Autowired
	CommentDao comment_dao;
	
	
	@RequestMapping("/board_comment_list.do")
	public String CommentListAction(CommentVo vo,Model model) {
		
		
		//int c_no= vo.getC_no();
		int b_no= vo.getB_no();

		Map map = new HashMap();

			
		map.put("b_no",b_no);
		

		
		// 댓글목록 조회
		List<CommentVo> c_list = comment_dao.selectList(map);
		
		
		model.addAttribute("c_list", c_list);
		
		
		return common.ShortCut.Front.VIEW_PATH+"board_comment";
	}
	@RequestMapping("/board_comment_insert.do")
	@ResponseBody
	public String CommentInsertAction(CommentVo vo,HttpServletRequest request) {
		
		String c_ip = request.getRemoteAddr();
		String c_content = request.getParameter("c_content").replaceAll("\n", "<br>");
		vo.setC_ip(c_ip);
		vo.setC_content(c_content);
		
		int res = comment_dao.insert(vo);
		
		String resultStr = (res==0) ? "fail" : "success";
		
		return resultStr;
	}
	@RequestMapping("/board_comment_delete.do")
	public String CommentDeleteAction(CommentVo vo,Model model,Integer page) {
		int c_no = vo.getC_no();
		
		System.out.println(c_no);
		
		int res= comment_dao.delete(c_no);
		
		model.addAttribute("b_no",vo.getB_no());
		model.addAttribute("page",page);
		
		
		
		
		return "redirect:board_view.do";
	}
	

}
