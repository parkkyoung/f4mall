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
	
	
	// 회원리스트
	public List<MemberVo> select_list(){
		
		List<MemberVo> list = null;
		
		list = sqlSession.selectList("member_list");
		
		return list;
	}


	
	public MemberVo selectOne(String m_id) {
		// TODO Auto-generated method stub
		
		MemberVo vo = null;
		
		vo = sqlSession.selectOne("check_id",m_id);
		
		return vo;
	}


	public int insert_id(MemberVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		res = sqlSession.insert("insert_id",vo);
		
		return res;
	}
	
	
}
