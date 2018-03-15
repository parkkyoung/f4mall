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

	/**
	 * ������ ���
	 * @return
	 */
	public List<ItemsVo> select_list(int p_no) {
		// TODO Auto-generated method stub
		List<ItemsVo> list = null;
		list = sqlSession.selectList("items_list", p_no);
		return list;
	}
	
	/**
	 * ������ ����
	 * @param i_no
	 * @return
	 */
	public int delete_items(int i_no) {
		// TODO Auto-generated method stub
		int res = 0;
		res = sqlSession.delete("items_delete", i_no);
		return 0;
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

	public int insert_items(ItemsVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		res = sqlSession.insert("items_insert",vo);
		return res;
	}
	
	
	
}
