package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CommentDao;
import util.Paging;
import vo.CommentVo;

@Controller
public class CommentController {
	
	@Autowired
	CommentDao comment_dao;
	
	
	@RequestMapping("/board_comment_list.do")
	public String CommentListAction(CommentVo vo,String page,Model model) {
		
		
		int c_no= vo.getC_no();
		
		//페이지 호출
		int nowPage = 1;
				
		if(!(page==null || page.isEmpty())) {
			nowPage = Integer.parseInt(page);
		}
		// 가져올 게시물 순서 (start,end) 계산.
		int start = (nowPage-1)*common.Constant.Comment.BLOCKLIST+1;
		int end = start + common.Constant.Comment.BLOCKPAGE-1;
		// 맵에 start와 end집어넣기
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("c_no",c_no);		
		
		int rowTotal = comment_dao.getRowTotal(c_no);
		
		//pageMenu 만들기
		String pageMenu = Paging.getPagingList
										("board_comment_list.do", 
										   nowPage, 
										   rowTotal, 
										   common.Constant.Comment.BLOCKLIST, 
										   common.Constant.Comment.BLOCKPAGE);
		
		
		
		
		// 댓글목록 조회
		List<CommentVo> c_list = comment_dao.selectList(map);
		
		model.addAttribute("c_list", c_list);
		model.addAttribute("pageMenu", pageMenu);
		
		return common.ShortCut.Front.VIEW_PATH+"board_comment";
	}
	

}
