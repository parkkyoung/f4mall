package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.ProductVo;
import vo.option.BrandVo;
import vo.option.CategoryVo;
import vo.option.ColorVo;
import vo.option.MaterialVo;
import vo.option.SexVo;
import vo.option.SizeVo;

@Repository
public class ProductDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public ProductDao() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 상품목록
	 * @return
	 */
	public List<ProductVo> select_list(){
		List<ProductVo> list = null;
		list = sqlSession.selectList("product_list");
		return list;
	}
	
	/**
	 * 상품 1개 뽑기
	 * @param p_no
	 * @return
	 */
	public ProductVo select_one(int p_no) {
		// TODO Auto-generated method stub
		ProductVo vo = null;
		vo = sqlSession.selectOne("product_view",p_no);
		return vo;
	}

	/**
	 * 가장 최신 p_no 뽑기
	 * @return
	 */
	public int selectMaxNo() {
		// TODO Auto-generated method stub
		int p_no = 0;
		p_no = sqlSession.selectOne("product_maxno");
		return p_no;
	}

	/**
	 * 상품 등록
	 * @param vo
	 * @return
	 */
	public int insert_product(ProductVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		res = sqlSession.insert("product_insert",vo);
		return res;
	}
	
	/**
	 * 상품 수정
	 * @param vo
	 * @return
	 */
	public int update_product(ProductVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		res = sqlSession.insert("product_update",vo);
		return res;
	}

	/**
	 * 상품 삭제
	 * @param vo
	 * @return
	 */
	public int delete_product(int p_no) {
		// TODO Auto-generated method stub
		int res = 0;
		res = sqlSession.delete("product_delete", p_no);
		return 0;
	}
	
	// 상품 옵션
	public List<CategoryVo> category(){
		List<CategoryVo> list = null;
		list = sqlSession.selectList("category");
		return list;
	}
	public List<MaterialVo> material(){
		List<MaterialVo> list = null;
		list = sqlSession.selectList("material");
		return list;
	}
	public List<ColorVo> color(){
		List<ColorVo> list = null;
		list = sqlSession.selectList("color");
		return list;
	}
	public List<SexVo> sex(){
		List<SexVo> list = null;
		list = sqlSession.selectList("sex");
		return list;
	}
	public List<BrandVo> brand(){
		List<BrandVo> list = null;
		list = sqlSession.selectList("brand");
		return list;
	}
	public List<SizeVo> size(){
		List<SizeVo> list = null;
		list = sqlSession.selectList("size");
		return list;
	}
}
