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
	 * 프론트 상품목록
	 * @param model
	 * @return
	 */
	@RequestMapping("/product_list.do")
	public String product_list(Model model, String category_name,String sex_name, String brand_name, String p_name){
		
		// List 포장
		List<ProductVo> p_list;
		
		// 필터링해서 검색할 때
		if(category_name != null) p_list = product_dao.product_category_list(category_name); // 카테고리별
		else if(sex_name != null) p_list = product_dao.product_sex_list(sex_name); // 성별
		else if(brand_name != null) p_list = product_dao.product_brand_list(brand_name); // 브랜드별
		// 검색했을때
		else if(p_name != null) p_list = product_dao.product_find_list(p_name);
		// 아무것도 없을 때
		else p_list = product_dao.product_list();
		
		model.addAttribute("p_list", p_list);
		
		return common.ShortCut.Front.VIEW_PATH+"goods";
	}
	
	
	@RequestMapping("product_view.do")
	public String product_view(Model model, Integer p_no) {
		
		// p_no를 기준으로 vo 포장
		ProductVo vo = product_dao.select_one(p_no);
		model.addAttribute("vo",vo);
		return "front/goods_view";
	}
	
	/**
	 * 어드민 상품목록
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/goods_list.do")
	public String product_list_admin(Model model){
		
		// 상품 리스트에 포장
		List<ProductVo> p_list = product_dao.product_list();
		model.addAttribute("p_list", p_list);
		
		return common.ShortCut.Admin.ADMIN_VIEW_PATH+"goods";
	}
	
	/**
	 * 어드민 상품등록 폼
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/goods_insert_form.do")
	public String product_insert_form(Model model){
		
		// 등록 폼으로 이동
		return common.ShortCut.Admin.ADMIN_VIEW_PATH+"goods_insert";
	}
	
	
	/**
	 * 어드민 상품등록
	 * @param vo
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("/admin/goods_insert.do")
	public String product_insert(ProductVo vo,Model model) throws IllegalStateException, IOException{
		
		// 이미지 저장경로
		String webPath="/resources/upload/";
		String savePath=application.getRealPath(webPath);
		
		int imageIndex=0;
		for(MultipartFile photo : vo.getP_image()){
		
			// 썸네일이미지 업로드된 파일정보
			//MultipartFile photo1 = vo.getP_image_m();
			
			// 썸네일이미지 업로드된 파일이 있으면
			if(!photo.isEmpty()) {
				String filename="no_file";
				//업로드된 화일명 구하기
				filename = photo.getOriginalFilename();
				//저장할 화일정보
				File saveFile = new File(savePath,filename);
				//이미 동일화일이 존재하냐?
				if(saveFile.exists()) {
					long milisec = System.currentTimeMillis();
					filename = String.format("%d_%s", milisec,filename);
					saveFile = new File(savePath,filename);
				}
				//MultipartResolver의 임시저장소=>복사해온다
				photo.transferTo(saveFile);
				if(imageIndex==0) vo.setP_image_m(filename);
				else vo.setP_image_s(filename);
				imageIndex++;
			}
		}
		
		// vo 포장해서 db 삽입
		int res = product_dao.insert_product(vo);
		
		// 상세로 넘어갈때 파라미터로 넘길 상품번호
		int p_no = product_dao.selectMaxNo();
		model.addAttribute("p_no",p_no);
		
		// 등록한 상품 기준 상세페이지로 이동
		return "redirect:goods_update_form.do";
	}
	
	/**
	 * 어드민 상세(수정)
	 * @param model
	 * @param p_no
	 * @return
	 */
	@RequestMapping("/admin/goods_update_form.do")
	public String product_update_form(Model model,int p_no){

		// 기존 값들을 뿌려줄 vo 포장
		ProductVo vo = new ProductVo();
		vo = product_dao.select_one(p_no);
		model.addAttribute("vo", vo);
		
		// 아이템 리스트에 포장
		List<ItemsVo> i_list = items_dao.select_list(p_no);
		model.addAttribute("i_list", i_list);
		
		// 아이템 등록용 옵션 포린 리스트 포장
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
	 * 어드민 상품수정
	 * @param vo
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("/admin/goods_update.do")
	public String product_update(ProductVo vo, Model model) throws IllegalStateException, IOException{
		
		// 이미지 저장경로
		String webPath="/resources/upload";
		String savePath=application.getRealPath(webPath);
		
		int imageIndex=0;
		for(MultipartFile photo : vo.getP_image()){
		
			// 썸네일이미지 업로드된 파일정보
			//MultipartFile photo1 = vo.getP_image_m();
			
			// 썸네일이미지 업로드된 파일이 있으면
			if(!photo.isEmpty()) {
				String filename="no_file";
				//업로드된 화일명 구하기
				filename = photo.getOriginalFilename();
				//저장할 화일정보
				File saveFile = new File(savePath,filename);
				//이미 동일화일이 존재하냐?
				if(saveFile.exists()) {
					long milisec = System.currentTimeMillis();
					filename = String.format("%d_%s", milisec,filename);
					saveFile = new File(savePath,filename);
				}
				//MultipartResolver의 임시저장소=>복사해온다
				photo.transferTo(saveFile);
				if(imageIndex==0) vo.setP_image_m(filename);
				else vo.setP_image_s(filename);
				imageIndex++;
			}
		}
		
		// 수정 vo를 db에 업데이트
		int res = product_dao.update_product(vo);
		
		// 상세로 넘어갈때 파라미터로 넘길 상품번호
		int p_no = product_dao.selectMaxNo();
		model.addAttribute("p_no",p_no);
		
		// 수정된 상품 상세페이지로 이동
		return "redirect:goods_update_form.do";
	}
	
	/**
	 * 상품 삭제
	 * @param p_no
	 * @return
	 */
	@RequestMapping("/admin/product_delete.do")
	public String product_delete(int p_no){
		
		// p_no를 기준으로 상품 삭제
		int res = product_dao.delete_product(p_no);
		
		// 리스트 페이지로 이동
		return "redirect:goods_list.do";
	}
}
