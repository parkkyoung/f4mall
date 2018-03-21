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
	 * 최근 한달 회원가입 멤버 수
	 * @return
	 */
	public int count_member(){
		int count = 0;
		count = sqlSession.selectOne("count_member");
		return count; 
	}
	
	/**
	 * 최근 한달 주문 수
	 * @return
	 */
	public int count_demand() {
		// TODO Auto-generated method stub
		int count = 0;
		count = sqlSession.selectOne("count_demand");
		return count; 
	}
	
	/**
	 * 최근 한달 상품평 수
	 * @return
	 */
	public int count_eval() {
		// TODO Auto-generated method stub
		int count = 0;
		count = sqlSession.selectOne("count_eval");
		return count; 
	}
	
	/**
	 * 최근 한달 상품등록 수
	 * @return
	 */
	public int count_product() {
		// TODO Auto-generated method stub
		int count = 0;
		count = sqlSession.selectOne("count_product");
		return count; 
	}
	
	/**
	 * 카테고리별 주문 통계
	 * @return
	 */
	public GraphCategoryVo count_category01() {
		// TODO Auto-generated method stub
		GraphCategoryVo vo = null;
		vo = sqlSession.selectOne("count_category01");
		return vo;
	}
	
	/**
	 * 카테고리별 최근 주간 주문 통계
	 * @return
	 */
	public GraphCategoryVo count_category02() {
		// TODO Auto-generated method stub
		GraphCategoryVo vo = null;
		vo = sqlSession.selectOne("count_category02");
		return vo;
	}
	
	/**
	 * 카테고리별 최근 월간 주문 통계
	 * @return
	 */
	public GraphCategoryVo count_category03() {
		// TODO Auto-generated method stub
		GraphCategoryVo vo = null;
		vo = sqlSession.selectOne("count_category03");
		return vo;
	}
	
	/**
	 * 성별 주문 통계
	 * @return
	 */
	public GraphCategoryVo count_sex01() {
		// TODO Auto-generated method stub
		GraphCategoryVo vo = null;
		vo = sqlSession.selectOne("count_sex01");
		return vo;
	}
	
	/**
	 * 성별 최근 주간 주문 통계
	 * @return
	 */
	public GraphCategoryVo count_sex02() {
		// TODO Auto-generated method stub
		GraphCategoryVo vo = null;
		vo = sqlSession.selectOne("count_sex02");
		return vo;
	}
	
	/**
	 * 성별 최근 월간 주문 통계
	 * @return
	 */
	public GraphCategoryVo count_sex03() {
		// TODO Auto-generated method stub
		GraphCategoryVo vo = null;
		vo = sqlSession.selectOne("count_sex03");
		return vo;
	}
	
	/**
	 * 브랜드별 주문 통계
	 * @return
	 */
	public GraphCategoryVo count_brand01() {
		// TODO Auto-generated method stub
		GraphCategoryVo vo = null;
		vo = sqlSession.selectOne("count_brand01");
		return vo;
	}
	
	/**
	 * 브랜드별 최근 주간 주문 통계
	 * @return
	 */
	public GraphCategoryVo count_brand02() {
		// TODO Auto-generated method stub
		GraphCategoryVo vo = null;
		vo = sqlSession.selectOne("count_brand02");
		return vo;
	}
	
	/**
	 * 브랜드별 최근 월간 주문 통계
	 * @return
	 */
	public GraphCategoryVo count_brand03() {
		// TODO Auto-generated method stub
		GraphCategoryVo vo = null;
		vo = sqlSession.selectOne("count_brand03");
		return vo;
	}
	
	/**
	 * 지역별 최근 1달 주문 통계
	 * @return
	 */
	public GraphAddrVo count_addr01() {
		// TODO Auto-generated method stub
		GraphAddrVo vo = null;
		vo = sqlSession.selectOne("count_addr01");
		return vo;
	}
	
	/**
	 * 지역별 이전달 주문 통계
	 * @return
	 */
	public GraphAddrVo count_addr02() {
		// TODO Auto-generated method stub
		GraphAddrVo vo = null;
		vo = sqlSession.selectOne("count_addr02");
		return vo;
	}
	
	/**
	 * 지역별 전전달 주문 통계
	 * @return
	 */
	public GraphAddrVo count_addr03() {
		// TODO Auto-generated method stub
		GraphAddrVo vo = null;
		vo = sqlSession.selectOne("count_addr03");
		return vo;
	}
}
