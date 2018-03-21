package vo;

public class CommentVo {

	int c_no;
	int b_no;
	String m_id;
	String c_content;
	String c_ip;
	String c_regdate;
	
	
	/**************************** VO 내부로만 사용 ***********************************/
	
	/*멤버 이미지 가져오기. [mapper xml참고]*/
	
	String c_image;
	
	public String getC_image() {
		return c_image;
	}

	/* 멤버닉네임가져오기*/
	String c_nick;
	public String getC_nick() {
		return c_nick;
	}
	
	/* 댓글 총 갯수*/
	int cnt;
	
	public int getCnt() {
		return cnt;
	}
	/* comment 총 개수 확인*/
	int no;
	
	public int getNo() {
		return no;
	}
	
	
	/**************************** VO 내부로만 사용 END***********************************/
	
	
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
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
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getC_ip() {
		return c_ip;
	}
	public void setC_ip(String c_ip) {
		this.c_ip = c_ip;
	}
	public String getC_regdate() {
		return c_regdate;
	}
	public void setC_regdate(String c_regdate) {
		this.c_regdate = c_regdate;
	}

	
	
	
}
