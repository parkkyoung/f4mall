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
import dao.CartDao;
import dao.MemberDao;
import vo.CartVo;
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
	CartDao cart_dao;

	@Autowired
	HttpServletRequest request;

	public MemberController() {
		// TODO Auto-generated constructor stub
	}

	
	/**
	 * ȸ�����
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
	 * �Ϲ�ȸ�� ���̵�üũ
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
	 * �г����ߺ�üũ
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
	 * �Ϲ�ȸ������ �̿���������
	 * @return
	 */
	@RequestMapping(value = "/member_join_clause.do")
	public String member_join_clause() {

		return ShortCut.Front.VIEW_PATH + "join";
	}

	
	/**
	 * �Ϲ�ȸ������ ��
	 * @return
	 */
	@RequestMapping(value = "/member_join_form.do")
	public String member_join_form() {

		return ShortCut.Front.VIEW_PATH + "join2";
	}
	
	
	/**
	 * �Ϲ�ȸ������
	 * @return
	 */
	@RequestMapping(value = "/member_insert.do")
	public String insert_id(MemberVo vo) throws IllegalStateException, IOException {

		String m_ip = request.getRemoteAddr();
		vo.setM_ip(m_ip);
		
		// �̹��� ������ / ȸ���� �̹��� ���� 1��
		String webPath = "resources/upload/";
		String savePath = application.getRealPath(webPath);

					
		MultipartFile photo = vo.getM_image_m();

		String filename = "no_file";
		// ������̹��� ���ε�� ������ ������
		if (!photo.isEmpty()) {
						
		// ���ε�� ȭ�ϸ� ���ϱ�
		filename = photo.getOriginalFilename();
		// ������ ȭ������
		File saveFile = new File(savePath, filename);
		// �̹� ����ȭ���� �����ϳ�?
		if (saveFile.exists()) {
			long milisec = System.currentTimeMillis();
			filename = String.format("%d_%s", milisec, filename);
			saveFile = new File(savePath, filename);
		}
		// MultipartResolver�� �ӽ������=>�����ؿ´�
		photo.transferTo(saveFile);
		
		}
					
		vo.setM_image(filename);

		int res = member_dao.insert_id(vo);

		return "redirect:product_list.do";
	}

	
	/**
	 * �Ϲ�ȸ��������
	 * @return
	 */
	@RequestMapping(value = "/member.do")
	public String member() {

		return ShortCut.Front.VIEW_PATH + "member";
	}

	
	/**
	 * �Ϲ�ȸ������
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
	 * ������ ȸ�����
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
	 * ������ ���̵�üũ
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
	 * ������ȸ������
	 * @return
	 */
	@RequestMapping(value = "/admin/member_insert_form.do")
	public String admin_insert_form() {

		return ShortCut.Admin.ADMIN_VIEW_PATH + "member_insert";
	}

	
	/**
	 * ������ ȸ������
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "/admin/member_insert.do")
	public String admin_insert_id(MemberVo vo) throws IllegalStateException, IOException {

		String m_ip = request.getRemoteAddr();
		vo.setM_ip(m_ip);

		// �̹��� ������ / ȸ���� �̹��� ���� 1��
		String webPath = "resources/upload/";
		String savePath = application.getRealPath(webPath);

		
		MultipartFile photo = vo.getM_image_m();

		String filename = "no_file";
		// ������̹��� ���ε�� ������ ������
		if (!photo.isEmpty()) {

			// ���ε�� ȭ�ϸ� ���ϱ�
			filename = photo.getOriginalFilename();
			// ������ ȭ������
			File saveFile = new File(savePath, filename);
			// �̹� ����ȭ���� �����ϳ�?
			if (saveFile.exists()) {
				long milisec = System.currentTimeMillis();
				filename = String.format("%d_%s", milisec, filename);
				saveFile = new File(savePath, filename);
			}
			// MultipartResolver�� �ӽ������=>�����ؿ´�
			photo.transferTo(saveFile);
		}

		vo.setM_image(filename);


		int res = member_dao.insert_id(vo);

		return "redirect:goods_list.do";
	}

	
	/**
	 * ȸ������ ������
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
	 * ȸ������ ����
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "/admin/member_update.do")
	public String adm_update(MemberVo vo) throws IllegalStateException, IOException {

		String m_ip = request.getRemoteAddr();

		vo.setM_ip(m_ip);
		
		int res = member_dao.member_update(vo);

		return "redirect:/admin/member_list.do";
	}
	
	/**
	 * �̹��� üũ
	 * @param vo
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping("/check_image.do")
	public String image_check(MemberVo vo) throws IllegalStateException, IOException {
			return "redirect:/admin/member_update.do";
	}

	
	/**
	 * �α���üũ
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
		// ���̵� Ʋ�����
		if (user == null) {
			result = "id_fail";
			resultStr = String.format("[{'result':'%s'}]", result);
			return resultStr;
		}

		// ��й�ȣ�� Ʋ�����
		if (user.getM_pwd().equals(m_pwd) == false) {
			result = "pwd_fail";
			resultStr = String.format("[{'result':'%s'}]", result);
			return resultStr;
		}

		// �α��������� ���ǿ� ����
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		result = "yes";
		resultStr = String.format("[{'result':'%s'}]", result);
		
		// īƮ ���� ����
		List<CartVo> cart_list = cart_dao.select_list(user.getM_id());
		session.setAttribute("header_cart_list",cart_list);
		
		return resultStr;

	}

	
	/**
	 * �α׾ƿ�üũ
	 * @param vo
	 * @return
	 */
	@RequestMapping("/logout.do")
	@ResponseBody
	public String logout(MemberVo vo) {

		System.out.println("�α׾ƿ�");
		
		// ���� ����
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.removeAttribute("header_cart_list");
		
		String result = "yes";
		String resultStr = "";
		resultStr = String.format("[{'result':'%s'}]", result);

		return resultStr;
	}
	
	/**
	 * ���� �ֹ����
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/member_orders.do")
	public String member_orders_admin(Model model) {
		
		// �ֹ� ��� ��������
		List<DemandVo> mo_list = member_dao.molist();
		model.addAttribute("mo_list", mo_list);
		
		return ShortCut.Admin.ADMIN_VIEW_PATH+"member_orders";
	}
	
	/**
	 * ���� �ֹ���
	 * @param model
	 * @param o_no
	 * @return
	 */
	@RequestMapping("/admin/member_order.do")
	public String member_order_admin(Model model, int o_no){
		
		// �ֹ� �� ��������
		DemandVo vo = member_dao.demand_one(o_no);
		model.addAttribute("vo", vo);
		
		return ShortCut.Admin.ADMIN_VIEW_PATH+"member_order";
	}
	
	/**
	 * �ֹ����� ����
	 * @param model
	 * @param o_no
	 * @param o_status
	 * @return
	 */
	@RequestMapping("/admin/update_o_status.do")
	public String update_o_status(Model model, DemandVo vo){

		System.out.println("��Ʈ�ѷ� o_no : "+vo.getO_no());
		System.out.println("��Ʈ�ѷ� o_status : "+vo.getO_status());
		
		// �ֹ� ���� ����
		int res = member_dao.update_o_status(vo);
		
		// �ֹ� �� �ѱ� �ֹ� ��ȣ �Ķ����
		model.addAttribute("o_no", vo.getO_no());
		
		return "redirect:member_order.do";
	}
	
	/**
	 * �ֹ� ���
	 * @param model
	 * @param m_id
	 * @return
	 */
	@RequestMapping("/member_orders.do")
	public String member_orders(Model model, String m_id){
		
		// ȸ���� �ֹ� ����Ʈ ��������
		List<DemandVo> d_list = member_dao.demand_list(m_id);
		model.addAttribute("d_list", d_list);
		
		return ShortCut.Front.VIEW_PATH+ "member_orders";
	}
	
	/**
	 * �ֹ� ��
	 * @param model
	 * @param o_no
	 * @return
	 */
	@RequestMapping("/member_order.do")
	public String member_order(Model model, int o_no){
		
		// �ֹ� �� ��������
		DemandVo vo = member_dao.demand_one(o_no);
		model.addAttribute("vo", vo);

		return ShortCut.Front.VIEW_PATH+ "member_order";
	}
	
	/**
	 * �ֹ� ���
	 * @param model
	 * @param o_no
	 * @param m_id
	 * @return
	 */
	@RequestMapping("/order_cancel.do")
	public String order_cancel(Model model, int o_no, String m_id){
		
		// �ֹ� ĵ��
		int res = member_dao.demand_cancel(o_no);
		
		// �ֹ� ������� �̵�
		model.addAttribute("m_id", m_id);
		return "redirect:member_orders.do";
	}

}
