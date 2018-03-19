package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.ProductVo;

@Repository
public class MainDao {
	
	@Autowired
	SqlSession sqlSession;

	public MainDao() {
		super();
	}
	
	public List<ProductVo> main_list01() {
		// TODO Auto-generated method stub
		List<ProductVo> list = null;
		list = sqlSession.selectList("list01");
		return list;
	}
	
	public List<ProductVo> main_list02() {
		// TODO Auto-generated method stub
		List<ProductVo> list = null;
		list = sqlSession.selectList("list02");
		return list;
	}
	
	public List<ProductVo> main_list03() {
		// TODO Auto-generated method stub
		List<ProductVo> list = null;
		list = sqlSession.selectList("list03");
		return list;
	}
	
	public List<ProductVo> main_list04() {
		// TODO Auto-generated method stub
		List<ProductVo> list = null;
		list = sqlSession.selectList("list04");
		return list;
	}
	
	public List<ProductVo> main_list05() {
		// TODO Auto-generated method stub
		List<ProductVo> list = null;
		list = sqlSession.selectList("list05");
		return list;
	}
	
	public List<ProductVo> main_list06() {
		// TODO Auto-generated method stub
		List<ProductVo> list = null;
		list = sqlSession.selectList("list06");
		return list;
	}
	
	public List<ProductVo> main_list07() {
		// TODO Auto-generated method stub
		List<ProductVo> list = null;
		list = sqlSession.selectList("list07");
		return list;
	}
	
	public List<ProductVo> main_list08() {
		// TODO Auto-generated method stub
		List<ProductVo> list = null;
		list = sqlSession.selectList("list08");
		return list;
	}
	
	public List<ProductVo> main_list09() {
		// TODO Auto-generated method stub
		List<ProductVo> list = null;
		list = sqlSession.selectList("list09");
		return list;
	}
	
}
