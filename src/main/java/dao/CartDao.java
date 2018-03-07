package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CartVo;

@Repository("cart_dai")
public class CartDao {

	@Autowired
	SqlSession sqlSession;
	
	public CartDao() {
		// TODO Auto-generated constructor stub
	}

	public int cart_insert(Map map) {
		// TODO Auto-generated method stub
		int res = 0;
		
		res = sqlSession.insert("cart_insert",map);
		
		return res;
	}

	public List<CartVo> select_list(String m_id) {
		// TODO Auto-generated method stub
		List<CartVo> c_list = null;
		
		c_list = sqlSession.selectList("cart_view",m_id);
		
		return c_list;
	}

	
}
