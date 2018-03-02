package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.FaqVo;

@Repository("faq_dao")
public class FaqDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public FaqDao() {
		// TODO Auto-generated constructor stub
	}
	
	public List<FaqVo> select_list(){
		List<FaqVo> list = null;
		list = sqlSession.selectList("faq_list");
		return list;
	}
	
}
