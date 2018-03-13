package vo;

public class BoardVo {
	/*	2018��3��7��(seo) 	*/
	public BoardVo() {
		// TODO Auto-generated constructor stub
		
	}
	
	int b_no;
	String m_id; /* foreign key*/
	String b_name;
	String b_content;
	String b_ip;
	int b_readhit;
	String b_regdate;
	int b_notice;
	int b_ref;
	int b_step;
	int b_depth;
	
	
	int no; 

	/* ���� ��¥�� Ȯ��.*/
	String today;

	public String getToday() {
		return today;
	}
	
	/* ���� ��¥ ��-��-�� ����*/
	String todayShort;
	

	public String getTodayShort() {
		
		String str = getToday().substring(0,10);
		
		return str;
	}

	/* �� �Խù� ��� ����*/
	int listCount;
	
	public int getListCount() {
		return listCount;
	}
	/*//�� �Խù� ��� ����*/

	int cnt;
	
	/* no�� ������ �ѹ��� ���������� �����ֱ� ����.*/
	public int getNo() {
		return no;
	}
	/* cnt�� �Խù� �������� ������ ��������� ���� ��.*/
	/* �������� �� �Խù� �� ����*/
	public int getCnt() {
		return cnt;
	}

	/* �ۼ��� ��-��-�Ϸ� ��ȯ*/
	String b_regdateShort;
	
	public String getB_regdateShort() {
		
		String str = getB_regdate().substring(0, 10);
		return str;
	}
	public BoardVo(int b_no, String m_id, String b_name, String b_content, String b_ip,int b_readhit, String b_regdate,
			int b_notice, int b_ref, int b_step, int b_depth) {
		super();
		this.b_no = b_no;
		this.m_id = m_id;
		this.b_name = b_name;
		this.b_content = b_content;
		this.b_ip = b_ip;
		this.b_readhit = b_readhit;
		this.b_regdate = b_regdate;
		this.b_notice = b_notice;
		this.b_ref = b_ref;
		this.b_step = b_step;
		this.b_depth = b_depth;
	}
	
	public BoardVo(int b_no, String m_id, String b_name, String b_content, String b_ip, String b_regdate,
			int b_notice, int b_ref) {
		super();
		this.b_no = b_no;
		this.m_id = m_id;
		this.b_name = b_name;
		this.b_content = b_content;
		this.b_ip = b_ip;
		this.b_regdate = b_regdate;
		this.b_notice = b_notice;
		this.b_ref = b_ref;
	}
	
	public BoardVo(String m_id, String b_name, String b_content, String b_ip, String b_regdate, int b_notice) {
		super();
		this.m_id = m_id;
		this.b_name = b_name;
		this.b_content = b_content;
		this.b_ip = b_ip;
		this.b_regdate = b_regdate;
		this.b_notice = b_notice;
	}
	
	
	public BoardVo(int b_no, String m_id, String b_name, String b_content, String b_ip, String b_regdate,
			int b_notice) {
		super();
		this.b_no = b_no;
		this.m_id = m_id;
		this.b_name = b_name;
		this.b_content = b_content;
		this.b_ip = b_ip;
		this.b_regdate = b_regdate;
		this.b_notice = b_notice;
	}

	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_ip() {
		return b_ip;
	}
	public void setB_ip(String b_ip) {
		this.b_ip = b_ip;
	}
	public int getB_readhit() {
		return b_readhit;
	}
	public void setB_readhit(int b_readhit) {
		this.b_readhit = b_readhit;
	}
	public String getB_regdate() {
		return b_regdate;
	}
	public void setB_regdate(String b_regdate) {
		this.b_regdate = b_regdate;
	}
	public int getB_notice() {
		return b_notice;
	}
	public void setB_notice(int b_notice) {
		this.b_notice = b_notice;
	}
	public int getB_ref() {
		return b_ref;
	}
	public void setB_ref(int b_ref) {
		this.b_ref = b_ref;
	}
	public int getB_step() {
		return b_step;
	}
	public void setB_step(int b_step) {
		this.b_step = b_step;
	}
	public int getB_depth() {
		return b_depth;
	}
	public void setB_depth(int b_depth) {
		this.b_depth = b_depth;
	}
	/*	//2018��3��7��(seo) 	*/
	
}