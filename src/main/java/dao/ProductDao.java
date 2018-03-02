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
}
