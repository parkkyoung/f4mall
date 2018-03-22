package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CommentVo;

@Repository
public class CommentDao {
	
	@Autowired
	SqlSession sqlSession;
	
	
	//´ñ±Û ¸®½ºÆ®
	/**
	 * 
	 * @param map
	 * @return
	 */
	public List<CommentVo> selectList(Map map){
		List<CommentVo> list = null;
		list = sqlSession.selectList("comment_select_list",map);
		return list;
	}

	//´ñ±Û¼ö È®ÀÎ
	/**
	 * 
	 * @param c_no
	 * @return
	 */
	public int getRowTotal(int c_no) {
		// TODO Auto-generated method stub
		int res = 0;
		
		res = sqlSession.selectOne("comment_row_total",c_no);
		
		return res;
	}
	
	//´ñ±Û»ðÀÔ
	/**
	 * 
	 * @param vo
	 * @return
	 */
	public int insert(CommentVo vo) {
		// TODO Auto-generated method stub
		int res =0;
		
		res = sqlSession.insert("comment_insert",vo);
		
		return res;
	}
	
	//´ñ±Û »èÁ¦
	/**
	 * 
	 * @param c_no
	 * @return
	 */
	public int delete(int c_no) {
		// TODO Auto-generated method stub
		int res =0;
		
		res = sqlSession.delete("comment_delete",c_no);
		
		return res;
	}

}
