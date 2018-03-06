package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.ProductVo;

@Repository
public class ProductDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public ProductDao() {
		// TODO Auto-generated constructor stub
	}
	
	public List<ProductVo> select_list(){
		
		List<ProductVo> list = null;
		
		list = sqlSession.selectList("product_list");
		
		return list;
	}

	public int insert_product(ProductVo vo) {
		// TODO Auto-generated method stub
		
		int res = 0;
		
		res = sqlSession.insert("product_insert",vo);
		
		return res;
	}

	public int delete_product(ProductVo vo) {
		// TODO Auto-generated method stub
		
		int res = 0;
		
		res = sqlSession.delete("product_delete",vo);
		
		return 0;
	}

	public ProductVo select_one(int p_no) {
		// TODO Auto-generated method stub
		ProductVo vo = null;
		
		vo = sqlSession.selectOne("product_view",p_no);
		
		return vo;
	}


}
