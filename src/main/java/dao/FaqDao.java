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
	
	// faq 전체목록
	public List<FaqVo> select_list(FaqVo vo){
		List<FaqVo> list = null;
		list = sqlSession.selectList("faq_list", vo);
		return list;
	}
	
	// faq 1개만 불러오기
	public FaqVo select_one(int f_no){
		FaqVo vo = null;
		vo = sqlSession.selectOne("faq_view", f_no);
		return vo;
	}
	
	// faq 등록
	public int insert(FaqVo vo){
		int res = 0;
		res = sqlSession.insert("faq_insert", vo);
		return res;
	}

	// faq 삭제
	public int delete(int f_no) {
		// TODO Auto-generated method stub
		System.out.println(f_no);
		int res = 0;
		res = sqlSession.delete("faq_delete", f_no);
		return res;
	}
	
	// faq 수정
	public int update(FaqVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		res = sqlSession.update("faq_update", vo);
		return res;
	}
	
}
