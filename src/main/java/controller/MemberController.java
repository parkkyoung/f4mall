package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import common.ShortCut;
import dao.MemberDao;
import vo.DemandVo;
import vo.MemberVo;



//Member Controller
@Controller
public class MemberController {

	@Autowired
	ServletContext application;

	@Autowired
	MemberDao member_dao;

	@Autowired
	HttpServletRequest request;

	public MemberController() {
		// TODO Auto-generated constructor stub
	}

	
	/**
	 * 회원목록
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/member_list.do")
	public String list(Model model) {

		List<MemberVo> m_list = member_dao.select_list();

		model.addAttribute("m_list", m_list);

		return "front/bongsung";

	}

	
	/**
	 * 일반회원 아이디체크
	 * @param model
	 * @param m_id
	 * @param pwd
	 * @return
	 */
	@RequestMapping(value = "/check_id.do")
	@ResponseBody
	public String check_id(Model model, String m_id, String pwd) {

		MemberVo vo = member_dao.selectOne(m_id);

		String result = "no";

		if (vo == null)
			result = "yes";

		String resultStr = String.format("[{'result':'%s'}]", result);

		return resultStr;
	}

	
	/**
	 * 닉네임중복체크
	 * @param model
	 * @param m_nick
	 * @return
	 */
	@RequestMapping(value = "/check_nick.do")
	@ResponseBody
	public String check_nick(Model model, String m_nick) {

		MemberVo vo = member_dao.selectOne(m_nick);

		String result = "no";

		if (vo == null)
			result = "yes";

		String resultStr = String.format("[{'result':'%s'}]", result);

		return resultStr;
	}

	
	/**
	 * 일반회원가입 이용약관페이지
	 * @return
	 */
	@RequestMapping(value = "/member_join_clause.do")
	public String member_join_clause() {

		return ShortCut.Front.VIEW_PATH + "join";
	}

	
	/**
	 * 일반회원가입 폼
	 * @return
	 */
	@RequestMapping(value = "/member_join_form.do")
	public String member_join_form() {

		return ShortCut.Front.VIEW_PATH + "join2";
	}
	
	
	/**
	 * 일반회원가입
	 * @return
	 */
	@RequestMapping(value = "/member_insert.do")
	public String insert_id(MemberVo vo) {

		String m_ip = request.getRemoteAddr();
		vo.setM_ip(m_ip);

		int res = member_dao.insert_id(vo);

		return "redirect:product_list.do";
	}

	
	/**
	 * 일반회원수정폼
	 * @return
	 */
	@RequestMapping(value = "/member.do")
	public String member() {

		return ShortCut.Front.VIEW_PATH + "member";
	}

	
	/**
	 * 일반회원수정
	 * @param vo
	 * @return
	 */
	@RequestMapping("/member_update.do")
	public String member_up(MemberVo vo) {

		String m_ip = request.getRemoteAddr();

		vo.setM_ip(m_ip);

		int res = member_dao.member_update(vo);

		return "redirect:index.do";
	}

	
	/**
	 * 관리자 회원목록
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/admin/member_list.do")
	public String m_list(Model model) {

		List<MemberVo> m_list = member_dao.select_list();

		model.addAttribute("m_list", m_list);

		return ShortCut.Admin.ADMIN_VIEW_PATH + "member";

	}

	
	/**
	 * 관리자 아이디체크
	 * @param model
	 * @param m_id
	 * @param pwd
	 * @return
	 */
	@RequestMapping(value = "/admin/check_id.do")
	@ResponseBody
	public String admin_check_id(Model model, String m_id, String pwd) {

		MemberVo vo = member_dao.selectOne(m_id);

		String result = "no";

		if (vo == null)
			result = "yes";

		String resultStr = String.format("[{'result':'%s'}]", result);

		return resultStr;
	}
	
	
	/**
	 * 관리자회원가입 
	 * @return
	 */
	@RequestMapping(value = "/admin/member_insert_form.do")
	public String admin_insert_form() {

		return ShortCut.Admin.ADMIN_VIEW_PATH + "member_insert";
	}

	
	/**
	 * 관리자 회원가입
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "/admin/member_insert.do")
	public String admin_insert_id(MemberVo vo) throws IllegalStateException, IOException {

		String m_ip = request.getRemoteAddr();
		vo.setM_ip(m_ip);

		// 이미지 저장경로 / 회원의 이미지 파일 1개
		String webPath = "resources/upload/";
		String savePath = application.getRealPath(webPath);

		
		MultipartFile photo = vo.getM_image_m();

		String filename = "no_file";
		// 썸네일이미지 업로드된 파일이 있으면
		if (!photo.isEmpty()) {
			
			// 업로드된 화일명 구하기
			filename = photo.getOriginalFilename();
			// 저장할 화일정보
			File saveFile = new File(savePath, filename);
			// 이미 동일화일이 존재하냐?
			if (saveFile.exists()) {
				long milisec = System.currentTimeMillis();
				filename = String.format("%d_%s", milisec, filename);
				saveFile = new File(savePath, filename);
			}
			// MultipartResolver의 임시저장소=>복사해온다
			photo.transferTo(saveFile);
		}
		
		vo.setM_image(filename);


		int res = member_dao.insert_id(vo);

		return "redirect:goods_list.do";
	}

	
	/**
	 * 회원정보 수정폼
	 * @param vo
	 * @param model
	 * @param m_id
	 * @return
	 */
	@RequestMapping(value = "/admin/member_update_form.do")
	public String ad_update(MemberVo vo, Model model, String m_id) {

		vo = member_dao.selectOne(m_id);

		model.addAttribute("vo", vo);

		return ShortCut.Admin.ADMIN_VIEW_PATH + "member_update";
	}

	
	/**
	 * 회원정보 수정
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "/admin/member_update.do")
	public String adm_update(MemberVo vo)throws IllegalStateException, IOException {

		String m_ip = request.getRemoteAddr();

		vo.setM_ip(m_ip);

		// 이미지 저장경로
		String webPath = "/resources/upload/";
		String savePath = application.getRealPath(webPath);

		MultipartFile photo = vo.getM_image_m();

		
		// 썸네일이미지 업로드된 파일이 있으면
		if (!photo.isEmpty()) {
			String filename = "no_file";	
			// 업로드된 화일명 구하기
			filename = photo.getOriginalFilename();
			// 저장할 화일정보
			File saveFile = new File(savePath, filename);
			// 이미 동일화일이 존재하냐?
			if (saveFile.exists()) {
				long milisec = System.currentTimeMillis();
				filename = String.format("%d_%s", milisec, filename);
				saveFile = new File(savePath, filename);
			}
			// MultipartResolver의 임시저장소=>복사해온다
			photo.transferTo(saveFile);
			vo.setM_image(filename);
		
		}
		
		int res = member_dao.member_update(vo);

		return "redirect:/admin/member_list.do";
	}

	
	/**
	 * 주문목록
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/member_order.do")
	public String member_order_form(Model model) {

		List<DemandVo> mo_list = member_dao.molist();

		model.addAttribute("mo_list", mo_list);

		return "admin/member_order";
	}

	
	/**
	 * 로그인체크
	 * @param m_id
	 * @param m_pwd
	 * @param request
	 * @return
	 */
	@RequestMapping("/login.do")
	@ResponseBody
	public String Login(String m_id, String m_pwd, HttpServletRequest request) {

		MemberVo user = member_dao.selectOne(m_id);

		String result = "no";
		String resultStr = "";
		// 아이디 틀린경우
		if (user == null) {
			result = "id_fail";
			resultStr = String.format("[{'result':'%s'}]", result);
			return resultStr;
		}

		// 비밀번호가 틀린경우
		if (user.getM_pwd().equals(m_pwd) == false) {
			result = "pwd_fail";
			resultStr = String.format("[{'result':'%s'}]", result);
			return resultStr;
		}

		// 로그인정보를 세션에 저장
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		result = "yes";
		resultStr = String.format("[{'result':'%s'}]", result);

		return resultStr;

	}

	
	/**
	 * 로그아웃체크
	 * @param vo
	 * @return
	 */
	@RequestMapping("/logout.do")
	public String logout(MemberVo vo) {

		System.out.println("로그아웃");

		HttpSession session = request.getSession();
		session.removeAttribute("user");

		return "redirect:product_list.do";
	}

}
