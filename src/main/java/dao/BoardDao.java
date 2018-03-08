package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.BoardVo;
import vo.MemberVo;

/*	2018��3��7��(seo) 	*/
@Repository("board_dao")
public class BoardDao {
	
	
	@Autowired
	SqlSession sqlSession;

	
	
	public BoardDao() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	/**
	 * 
	 * @param map
	 * @return
	 */
	// ���Ǻ� ������ ����Ʈ
	public List<BoardVo> selectList(Map map) {
		// TODO Auto-generated method stub
		List<BoardVo> list = null;

		// namespace.id
		list = sqlSession.selectList("board_list_condition", map);

		return list;
	}
	
	
	/**
	 * 
	 * @param map
	 * @return
	 */
	// �˻������� ���� map�� ���ڵ�� ���ϱ�
	public int getRowTotal(Map map) {
		// TODO Auto-generated method stub
		
		int total = 0;

		total = sqlSession.selectOne("board_row_total_condition",map);

		return total;

	}
	
	
	/**
	 * 
	 * @param vo
	 * @return
	 */
	// �Խ��� �Է�
	public int insert(BoardVo vo) {
		// TODO Auto-generated method stub
		int res = 0 ;
		
		res = sqlSession.insert("board_insert",vo);
		
		return res;
	}
/*	//2018��3��7��(seo) 	*/


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
	
	public int delete(int b_no) {
		// TODO Auto-generated method stub
		int res =0;
		
		res =sqlSession.delete("board_delete",b_no);
		
		return res;
	}
	
	
}
