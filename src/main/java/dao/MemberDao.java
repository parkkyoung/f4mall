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

	
	/**
	 * ȸ������Ʈ
	 * @return
	 */
	public List<MemberVo> select_list() {

		List<MemberVo> list = null;

		list = sqlSession.selectList("member_list");

		return list;
	}

	
	/**
	 * ���̵�üũ
	 * @param m_id
	 * @return
	 */
	public MemberVo selectOne(String m_id) {
		// TODO Auto-generated method stub

		MemberVo vo = null;

		vo = sqlSession.selectOne("check_id", m_id);

		return vo;
	}

	
	/**
	 * ȸ������
	 * @param vo
	 * @return
	 */
	public int insert_id(MemberVo vo) {
		// TODO Auto-generated method stub
		int res = 0;

		res = sqlSession.insert("insert_id", vo);

		return res;
	}

	
	/**
	 * ȸ������
	 * @param vo
	 * @return
	 */
	public int member_update(MemberVo vo) {

		int res = 0;

		res = sqlSession.update("member_update", vo);

		return res;
	}

	
	/**
	 * �ֹ����
	 * @return
	 */
	public List<DemandVo> molist() {
		// TODO Auto-generated method stub

		List<DemandVo> mo_list = null;

		mo_list = sqlSession.selectList("mo_list");

		return mo_list;
	}

	/**
	 * ȸ�� �ֹ� ���
	 * @param m_id
	 * @return
	 */
	public List<DemandVo> demand_list(String m_id) {
		// TODO Auto-generated method stub
		List<DemandVo> d_list = null;
		d_list = sqlSession.selectList("d_list", m_id);
		return d_list;
	}
	
	/**
	 * �ֹ� ��
	 * @param o_no
	 * @return
	 */
	public DemandVo demand_one(int o_no) {
		// TODO Auto-generated method stub
		DemandVo vo = null;
		vo = sqlSession.selectOne("d_one", o_no);
		return vo;
	}

	/**
	 * �ֹ� ���
	 * @param o_no
	 * @return
	 */
	public int demand_cancel(int o_no) {
		// TODO Auto-generated method stub
		int res = 0;
		res = sqlSession.update("d_cancel", o_no);
		return res;
	}

}
