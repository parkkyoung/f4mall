package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CartVo;
import vo.DemandVo;
import vo.MemberVo;

@Repository
public class DemandDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public DemandDao() {
		// TODO Auto-generated constructor stub
	}


	public List<CartVo> demand_list(Map map) {
		// TODO Auto-generated method stub
		List<CartVo> list = null;//new ArrayList<CartVo>();
		
		list = sqlSession.selectList("demand_list",map);
		
		return list;
	}


	public int selectTotalsales(String m_id) {
		// TODO Auto-generated method stub
		int sales_price = 0;
		
		sales_price = sqlSession.selectOne("sales_price",m_id);
		
		return sales_price;
	}


	public int demand_insert(DemandVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		res = sqlSession.insert("demand_insert",vo);
		
		return res;
	}
	
	

}
