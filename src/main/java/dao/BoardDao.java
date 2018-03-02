package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.BoardVo;
import vo.MemberVo;


@Repository("board_dao")
public class BoardDao {
	
	
	@Autowired
	SqlSession sqlSession;

	
	
	public BoardDao() {
		// TODO Auto-generated constructor stub
	}
	
	
	// Board리스트
	public List<BoardVo> selectlist(){
		
		List<BoardVo> list = null;
		
		list = sqlSession.selectList("board_list");
		
		return list;
	}


	// 조건별 페이지
	public List<BoardVo> selectList(Map map){
		// TODO Auto-generated method stub
		
		List<BoardVo> list = null;
		
		list = sqlSession.selectList("board_list_condition",map);
		
		return list;
	}
	
	//레코드수 구하기
	public int getRowTotal() {
		
		int total = 0;
		
		total = sqlSession.selectOne("board_row_total");
		
		return total;
	}
	
	// 검색제목을 넣은 레코드수
	public int getRowTotal(Map map) {
		
		int total = 0;
		
		total = sqlSession.selectOne("board_row_total_condition",map);
		
		return total;
	}
	
	// selectOne
	public BoardVo selectOne(int b_no) {
		
		BoardVo vo = null;
		
		vo = sqlSession.selectOne("board_one",b_no);
		
		return vo;
	}
	
	// updateHit
	public int updateHit(int readhit) {
		int res = 0;
		
		res = sqlSession.update("board_update_hit",readhit);
		
		return res;
	}
	public int insert(BoardVo vo) {
		// TODO Auto-generated method stub
		int res = 0;

		res = sqlSession.insert("board_insert", vo);
		
		return res;
	}
	
	//updateStep
	public int update_step(BoardVo baseVo) {
		
		int res = 0;
		
		res = sqlSession.update("board_update_step",baseVo);
		
		return res;
	}
	//답글
	public int reply(BoardVo vo) {
		int res = 0;
		
		res = sqlSession.insert("board_reply",vo);
		
		return res;
	}
	
	//업데이트
	public int update(BoardVo vo) {
		int res = 0;
		
		res = sqlSession.update("board_update",vo);
		
		return res;
	}
	// 삭제표시
	public int update_delete(BoardVo vo) {
		int res= 0;
		
		res = sqlSession.update("board_update_delete",vo);
		
		return res;
	}
	
	
	
}
