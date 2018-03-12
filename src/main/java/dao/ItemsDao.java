package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.ItemsViewVo;
import vo.ItemsVo;
import vo.ProductVo;

@Repository
public class ItemsDao {

	@Autowired
	SqlSession sqlSession;
	
	public ItemsDao() {
		// TODO Auto-generated constructor stub
	}

	public ProductVo select_one_view(Integer p_no) {
		// TODO Auto-generated method stub
		ProductVo vo = null;
		
		vo = sqlSession.selectOne("select_product",p_no);
		
		return vo;
	}

	public List<ItemsViewVo> items_list(Integer p_no) {
		// TODO Auto-generated method stub
		List<ItemsViewVo> list = null;
		
		list = sqlSession.selectList("items_view",p_no);
		
		return list;
	}
	
	
	
}
