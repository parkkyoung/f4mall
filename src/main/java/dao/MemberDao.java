package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.DemandVo;
import vo.MemberVo;


@Repository("member_dao")
public class MemberDao {
	
	
	@Autowired
	SqlSession sqlSession;

	
	
	public MemberDao() {
		// TODO Auto-generated constructor stub
	}
	
	
	// 회원리스트
	/**
	 * @return
	 */
	public List<MemberVo> select_list(){
		
		List<MemberVo> list = null;
		
		list = sqlSession.selectList("member_list");
		
		return list;
	}


	//아이디체크
	/**
	 * @param m_id
	 * @return
	 */
	public MemberVo selectOne(String m_id) {
		// TODO Auto-generated method stub
		
		MemberVo vo = null;
		
		vo = sqlSession.selectOne("check_id",m_id);
		
		return vo;
	}

	//회원가입
	/**
	 * @param vo
	 * @return
	 */
	public int insert_id(MemberVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		res = sqlSession.insert("insert_id",vo);
		
		return res;
	}
	
	
	//회원수정
	/**
	 * @param vo
	 * @return
	 */
	public int member_update(MemberVo vo){
		
		int res = 0;
		
		res = sqlSession.update("member_update",vo);
		
		return res;
	}

	//주문목록
	/**
	 * @return
	 */
	public List<DemandVo> molist() {
		// TODO Auto-generated method stub
		
		List<DemandVo> mo_list = null;
		
		mo_list = sqlSession.selectList("mo_list");
		
		return mo_list;
	} 
	
}
