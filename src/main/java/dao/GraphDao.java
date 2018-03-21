package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.graph.GraphAddrVo;
import vo.graph.GraphCategoryVo;

@Repository
public class GraphDao {

	@Autowired
	SqlSession sqlSession;
	
	public GraphDao() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * �ֱ� �Ѵ� ȸ������ ��� ��
	 * @return
	 */
	public int count_member(){
		int count = 0;
		count = sqlSession.selectOne("count_member");
		return count; 
	}
	
	/**
	 * �ֱ� �Ѵ� �ֹ� ��
	 * @return
	 */
	public int count_demand() {
		// TODO Auto-generated method stub
		int count = 0;
		count = sqlSession.selectOne("count_demand");
		return count; 
	}
	
	/**
	 * �ֱ� �Ѵ� ��ǰ�� ��
	 * @return
	 */
	public int count_eval() {
		// TODO Auto-generated method stub
		int count = 0;
		count = sqlSession.selectOne("count_eval");
		return count; 
	}
	
	/**
	 * �ֱ� �Ѵ� ��ǰ��� ��
	 * @return
	 */
	public int count_product() {
		// TODO Auto-generated method stub
		int count = 0;
		count = sqlSession.selectOne("count_product");
		return count; 
	}
	
	/**
	 * ī�װ��� �ֹ� ���
	 * @return
	 */
	public GraphCategoryVo count_category01() {
		// TODO Auto-generated method stub
		GraphCategoryVo vo = null;
		vo = sqlSession.selectOne("count_category01");
		return vo;
	}
	
	/**
	 * ī�װ��� �ֱ� �ְ� �ֹ� ���
	 * @return
	 */
	public GraphCategoryVo count_category02() {
		// TODO Auto-generated method stub
		GraphCategoryVo vo = null;
		vo = sqlSession.selectOne("count_category02");
		return vo;
	}
	
	/**
	 * ī�װ��� �ֱ� ���� �ֹ� ���
	 * @return
	 */
	public GraphCategoryVo count_category03() {
		// TODO Auto-generated method stub
		GraphCategoryVo vo = null;
		vo = sqlSession.selectOne("count_category03");
		return vo;
	}
	
	/**
	 * ���� �ֹ� ���
	 * @return
	 */
	public GraphCategoryVo count_sex01() {
		// TODO Auto-generated method stub
		GraphCategoryVo vo = null;
		vo = sqlSession.selectOne("count_sex01");
		return vo;
	}
	
	/**
	 * ���� �ֱ� �ְ� �ֹ� ���
	 * @return
	 */
	public GraphCategoryVo count_sex02() {
		// TODO Auto-generated method stub
		GraphCategoryVo vo = null;
		vo = sqlSession.selectOne("count_sex02");
		return vo;
	}
	
	/**
	 * ���� �ֱ� ���� �ֹ� ���
	 * @return
	 */
	public GraphCategoryVo count_sex03() {
		// TODO Auto-generated method stub
		GraphCategoryVo vo = null;
		vo = sqlSession.selectOne("count_sex03");
		return vo;
	}
	
	/**
	 * �귣�庰 �ֹ� ���
	 * @return
	 */
	public GraphCategoryVo count_brand01() {
		// TODO Auto-generated method stub
		GraphCategoryVo vo = null;
		vo = sqlSession.selectOne("count_brand01");
		return vo;
	}
	
	/**
	 * �귣�庰 �ֱ� �ְ� �ֹ� ���
	 * @return
	 */
	public GraphCategoryVo count_brand02() {
		// TODO Auto-generated method stub
		GraphCategoryVo vo = null;
		vo = sqlSession.selectOne("count_brand02");
		return vo;
	}
	
	/**
	 * �귣�庰 �ֱ� ���� �ֹ� ���
	 * @return
	 */
	public GraphCategoryVo count_brand03() {
		// TODO Auto-generated method stub
		GraphCategoryVo vo = null;
		vo = sqlSession.selectOne("count_brand03");
		return vo;
	}
	
	/**
	 * ������ �ֱ� 1�� �ֹ� ���
	 * @return
	 */
	public GraphAddrVo count_addr01() {
		// TODO Auto-generated method stub
		GraphAddrVo vo = null;
		vo = sqlSession.selectOne("count_addr01");
		return vo;
	}
	
	/**
	 * ������ ������ �ֹ� ���
	 * @return
	 */
	public GraphAddrVo count_addr02() {
		// TODO Auto-generated method stub
		GraphAddrVo vo = null;
		vo = sqlSession.selectOne("count_addr02");
		return vo;
	}
	
	/**
	 * ������ ������ �ֹ� ���
	 * @return
	 */
	public GraphAddrVo count_addr03() {
		// TODO Auto-generated method stub
		GraphAddrVo vo = null;
		vo = sqlSession.selectOne("count_addr03");
		return vo;
	}
}
