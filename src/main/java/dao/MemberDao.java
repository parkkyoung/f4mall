package dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import vo.MemberVo;


@Repository("member_dao")
public class MemberDao {
	
	
	@Autowired
	SqlSession sqlSession;

	
	
	public MemberDao() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public List<MemberVo> select_list(){
		
		List<MemberVo> list = null;
		
		list = sqlSession.selectList("member_list");
		
		return list;
	}
	
	
}
