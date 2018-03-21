package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.BoardVo;

@Repository("board_dao")
public class BoardDao {
	
	
	@Autowired
	SqlSession sqlSession;

	
	
	public BoardDao() {
		// TODO Auto-generated constructor stub
	}
	
	// 조건별 페이지 리스트
	/**
	 * 
	 * @param map
	 * @return
	 */
	public List<BoardVo> selectList(Map map) {
		// TODO Auto-generated method stub
		List<BoardVo> list = null;

		// namespace.id
		list = sqlSession.selectList("board_list_condition", map);

		return list;
	}
	
	// 검색제목을 넣은 map의 레코드수 구하기
	/**
	 * 
	 * @param map
	 * @return
	 */
	public int getRowTotal(Map map) {
		// TODO Auto-generated method stub
		
		int total = 0;

		total = sqlSession.selectOne("board_row_total_condition",map);

		return total;

	}
	
	// 게시판 입력	
	/**
	 * 
	 * @param vo
	 * @return
	 */
	public int insert(BoardVo vo) {
		// TODO Auto-generated method stub
		int res = 0 ;
		
		res = sqlSession.insert("board_insert",vo);
		
		return res;
	}
	
	// b_no로 게시글 가져오기.
	/**
	 * 
	 * @param b_no
	 * @return
	 */
	public BoardVo selectOne(int b_no) {
		// TODO Auto-generated method stub
		
		BoardVo vo = null;

		vo = sqlSession.selectOne("board_one", b_no);
		
		return vo;
	}

	// 조회수 증가
	/**
	 * 
	 * @param b_no
	 * @return
	 */
	public int updateHit(int b_no) {
		// TODO Auto-generated method stub
		int res = 0;

		res = sqlSession.update("board_update_hit", b_no);

		return res;
	}	
	
	//게시글 삭제
	/**
	 * 
	 * @param b_no
	 * @return
	 */
	public int delete(int b_no) {
		// TODO Auto-generated method stub
		int res =0;
		
		res =sqlSession.delete("board_delete",b_no);
		
		return res;
	}
	
	//게시글 수정
	/**
	 * 
	 * @param vo
	 * @return
	 */
	public int update(BoardVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		res = sqlSession.update("board_update",vo);
		
		return res;
	}


	//게시글 순서
	/**
	 * 
	 * @param baseVo
	 * @return
	 */
	public int update_step(BoardVo baseVo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		res = sqlSession.update("board_update_step",baseVo);
		
		return res;
	}

	//게시글 답변
	/**
	 * 
	 * @param vo
	 * @return
	 */
	public int reply(BoardVo vo) {
		// TODO Auto-generated method stub
		int res=0;
		
		res = sqlSession.insert("board_reply",vo);
		
		return res;
	}
	
	
}
