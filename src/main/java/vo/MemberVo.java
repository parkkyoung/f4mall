package vo;

import org.springframework.web.multipart.MultipartFile;

public class MemberVo {

	String m_id, m_pwd, m_name, m_addr, m_addr_d, m_zipcode, m_ip, m_regdate, m_nick, m_tel;
	MultipartFile m_image_m; //실제 업로드 되는 이미지
	String m_image;			 //이미지 filename
	int m_grade;

	// 기본생성자
	public MemberVo() {
		// TODO Auto-generated constructor stub
	}

	
	
	public MultipartFile getM_image_m() {
		return m_image_m;
	}

	public void setM_image_m(MultipartFile m_image_m) {
		this.m_image_m = m_image_m;
	}

	public String getM_image() {
		return m_image;
	}

	public void setM_image(String m_image) {
		this.m_image = m_image;
	}

	public String getM_tel() {
		return m_tel;
	}

	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pwd() {
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_addr() {
		return m_addr;
	}

	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}

	public String getM_addr_d() {
		return m_addr_d;
	}

	public void setM_addr_d(String m_addr_d) {
		this.m_addr_d = m_addr_d;
	}

	public String getM_zipcode() {
		return m_zipcode;
	}

	public void setM_zipcode(String m_zipcode) {
		this.m_zipcode = m_zipcode;
	}

	public String getM_ip() {
		return m_ip;
	}

	public void setM_ip(String m_ip) {
		this.m_ip = m_ip;
	}

	public String getM_regdate() {
		return m_regdate;
	}

	public void setM_regdate(String m_regdate) {
		this.m_regdate = m_regdate;
	}

	public String getM_nick() {
		return m_nick;
	}

	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}

	public int getM_grade() {
		return m_grade;
	}

	public void setM_grade(int m_grade) {
		this.m_grade = m_grade;
	}

}
