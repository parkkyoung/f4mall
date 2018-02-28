package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.TestVo;

@Repository
public class TestDao {
	
	@Autowired
	SqlSession sqlSession;

	public TestDao() {
		// TODO Auto-generated constructor stub
	}
	
	public List<TestVo> select_list(){
		List<TestVo> list = null;
		
		list = sqlSession.selectList("test_list");
		
		return list;
	}
	
}
