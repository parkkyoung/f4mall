package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import dao.ItemsDao;
import dao.ProductDao;
import vo.FaqVo;
import vo.ItemsVo;
import vo.ProductVo;
import vo.option.BrandVo;
import vo.option.CategoryVo;
import vo.option.ColorVo;
import vo.option.MaterialVo;
import vo.option.SexVo;
import vo.option.SizeVo;

@Controller
public class ProductController {

	@Autowired
	ServletContext application;
	@Autowired
	ProductDao product_dao;
	@Autowired
	ItemsDao items_dao;
	
	public ProductController() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * ����Ʈ ��ǰ���
	 * @param model
	 * @return
	 */
	@RequestMapping("/product_list.do")
	public String product_list(Model model, String category_name,String sex_name, String brand_name, String p_name){
		
		// List ����
		List<ProductVo> p_list;
		
		// ���͸��ؼ� �˻��� ��
		if(category_name != null) p_list = product_dao.product_category_list(category_name); // ī�װ���
		else if(sex_name != null) p_list = product_dao.product_sex_list(sex_name); // ����
		else if(brand_name != null) p_list = product_dao.product_brand_list(brand_name); // �귣�庰
		// �˻�������
		else if(p_name != null) p_list = product_dao.product_find_list(p_name);
		// �ƹ��͵� ���� ��
		else p_list = product_dao.product_list();
		
		model.addAttribute("p_list", p_list);
		
		return common.ShortCut.Front.VIEW_PATH+"goods";
	}
	
	
	@RequestMapping("product_view.do")
	public String product_view(Model model, Integer p_no) {
		
		// p_no�� �������� vo ����
		ProductVo vo = product_dao.select_one(p_no);
		model.addAttribute("vo",vo);
		return "front/goods_view";
	}
	
	/**
	 * ���� ��ǰ���
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/goods_list.do")
	public String product_list_admin(Model model){
		
		// ��ǰ ����Ʈ�� ����
		List<ProductVo> p_list = product_dao.product_list();
		model.addAttribute("p_list", p_list);
		
		return common.ShortCut.Admin.ADMIN_VIEW_PATH+"goods";
	}
	
	/**
	 * ���� ��ǰ��� ��
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/goods_insert_form.do")
	public String product_insert_form(Model model){
		
		// ��� ������ �̵�
		return common.ShortCut.Admin.ADMIN_VIEW_PATH+"goods_insert";
	}
	
	
	/**
	 * ���� ��ǰ���
	 * @param vo
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("/admin/goods_insert.do")
	public String product_insert(ProductVo vo,Model model) throws IllegalStateException, IOException{
		
		// �̹��� ������
		String webPath="/resources/upload/";
		String savePath=application.getRealPath(webPath);
		
		int imageIndex=0;
		for(MultipartFile photo : vo.getP_image()){
		
			// ������̹��� ���ε�� ��������
			//MultipartFile photo1 = vo.getP_image_m();
			
			// ������̹��� ���ε�� ������ ������
			if(!photo.isEmpty()) {
				String filename="no_file";
				//���ε�� ȭ�ϸ� ���ϱ�
				filename = photo.getOriginalFilename();
				//������ ȭ������
				File saveFile = new File(savePath,filename);
				//�̹� ����ȭ���� �����ϳ�?
				if(saveFile.exists()) {
					long milisec = System.currentTimeMillis();
					filename = String.format("%d_%s", milisec,filename);
					saveFile = new File(savePath,filename);
				}
				//MultipartResolver�� �ӽ������=>�����ؿ´�
				photo.transferTo(saveFile);
				if(imageIndex==0) vo.setP_image_m(filename);
				else vo.setP_image_s(filename);
				imageIndex++;
			}
		}
		
		// vo �����ؼ� db ����
		int res = product_dao.insert_product(vo);
		
		// �󼼷� �Ѿ�� �Ķ���ͷ� �ѱ� ��ǰ��ȣ
		int p_no = product_dao.selectMaxNo();
		model.addAttribute("p_no",p_no);
		
		// ����� ��ǰ ���� ���������� �̵�
		return "redirect:goods_update_form.do";
	}
	
	/**
	 * ���� ��(����)
	 * @param model
	 * @param p_no
	 * @return
	 */
	@RequestMapping("/admin/goods_update_form.do")
	public String product_update_form(Model model,int p_no){

		// ���� ������ �ѷ��� vo ����
		ProductVo vo = new ProductVo();
		vo = product_dao.select_one(p_no);
		model.addAttribute("vo", vo);
		
		// ������ ����Ʈ�� ����
		List<ItemsVo> i_list = items_dao.select_list(p_no);
		model.addAttribute("i_list", i_list);
		
		// ������ ��Ͽ� �ɼ� ���� ����Ʈ ����
		List<CategoryVo> category = product_dao.category();
		List<MaterialVo> material = product_dao.material();
		List<ColorVo> color = product_dao.color();
		List<SexVo> sex = product_dao.sex();
		List<BrandVo> brand= product_dao.brand();
		List<SizeVo> size = product_dao.size();

		model.addAttribute("category", category);
		model.addAttribute("material", material);
		model.addAttribute("color", color);
		model.addAttribute("sex", sex);
		model.addAttribute("brand", brand);
		model.addAttribute("size", size);
		
		return common.ShortCut.Admin.ADMIN_VIEW_PATH+"goods_update";
	}
	
	/**
	 * ���� ��ǰ����
	 * @param vo
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("/admin/goods_update.do")
	public String product_update(ProductVo vo, Model model) throws IllegalStateException, IOException{
		
		// �̹��� ������
		String webPath="/resources/upload";
		String savePath=application.getRealPath(webPath);
		
		int imageIndex=0;
		for(MultipartFile photo : vo.getP_image()){
		
			// ������̹��� ���ε�� ��������
			//MultipartFile photo1 = vo.getP_image_m();
			
			// ������̹��� ���ε�� ������ ������
			if(!photo.isEmpty()) {
				String filename="no_file";
				//���ε�� ȭ�ϸ� ���ϱ�
				filename = photo.getOriginalFilename();
				//������ ȭ������
				File saveFile = new File(savePath,filename);
				//�̹� ����ȭ���� �����ϳ�?
				if(saveFile.exists()) {
					long milisec = System.currentTimeMillis();
					filename = String.format("%d_%s", milisec,filename);
					saveFile = new File(savePath,filename);
				}
				//MultipartResolver�� �ӽ������=>�����ؿ´�
				photo.transferTo(saveFile);
				if(imageIndex==0) vo.setP_image_m(filename);
				else vo.setP_image_s(filename);
				imageIndex++;
			}
		}
		
		// ���� vo�� db�� ������Ʈ
		int res = product_dao.update_product(vo);
		
		// �󼼷� �Ѿ�� �Ķ���ͷ� �ѱ� ��ǰ��ȣ
		int p_no = product_dao.selectMaxNo();
		model.addAttribute("p_no",p_no);
		
		// ������ ��ǰ ���������� �̵�
		return "redirect:goods_update_form.do";
	}
	
	/**
	 * ��ǰ ����
	 * @param p_no
	 * @return
	 */
	@RequestMapping("/admin/product_delete.do")
	public String product_delete(int p_no){
		
		// p_no�� �������� ��ǰ ����
		int res = product_dao.delete_product(p_no);
		
		// ����Ʈ �������� �̵�
		return "redirect:goods_list.do";
	}
}
