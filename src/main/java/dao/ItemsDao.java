package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.EvalVo;
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
	 * 아이템 목록
	 * @return
	 */
	public List<ItemsVo> select_list(int p_no) {
		// TODO Auto-generated method stub
		List<ItemsVo> list = null;
		list = sqlSession.selectList("items_list", p_no);
		return list;
	}
	
	/**
	 * 아이템 삭제
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

	public List<ItemsViewVo> select_option(Integer p_no) {
		// TODO Auto-generated method stub
		List<ItemsViewVo> list = null;
		
		list = sqlSession.selectList("items_option",p_no);
		
		return list;
	}

	public int insert_items(ItemsVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		res = sqlSession.insert("items_insert",vo);
		return res;
	}

	public List<EvalVo> select_eval(Integer p_no) {
		// TODO Auto-generated method stub
		List<EvalVo> list = null;
		list = sqlSession.selectList("items_eval",p_no);
		return list;
	}

	public ItemsViewVo stock_check(Integer i_no) {
		// TODO Auto-generated method stub
		ItemsViewVo vo =null;
		
		vo = sqlSession.selectOne("check_stock",i_no);
		
		return vo;
	}

	public int get_i_no() {
		// TODO Auto-generated method stub
		int i_no = 0;
		
		i_no = sqlSession.selectOne("max_i_no");
		
		return i_no;
	}



	
	
	
}
