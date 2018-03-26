package vo;

public class DemandVo {
	int o_no, i_no, o_amt, o_tel, o_pay_amt, o_status;
	String m_id, o_addr, o_addr_d, o_zipcode, 
	o_regdate, o_payment, o_remarks, o_name;
	
	// 상품관련
	int p_no;
	String p_image_m, p_name;
	
	public DemandVo() {
		// TODO Auto-generated constructor stub
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_image_m() {
		return p_image_m;
	}

	public void setP_image_m(String p_image_m) {
		this.p_image_m = p_image_m;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getO_status() {
		return o_status;
	}

	public void setO_status(int o_status) {
		this.o_status = o_status;
	}

	public int getO_no() {
		return o_no;
	}

	public void setO_no(int o_no) {
		this.o_no = o_no;
	}

	public int getO_amt() {
		return o_amt;
	}

	public void setO_amt(int o_amt) {
		this.o_amt = o_amt;
	}

	public int getO_tel() {
		return o_tel;
	}

	public void setO_tel(int o_tel) {
		this.o_tel = o_tel;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getO_addr() {
		return o_addr;
	}

	public void setO_addr(String o_addr) {
		this.o_addr = o_addr;
	}

	public String getO_addr_d() {
		return o_addr_d;
	}

	public void setO_addr_d(String o_addr_d) {
		this.o_addr_d = o_addr_d;
	}

	public String getO_zipcode() {
		return o_zipcode;
	}

	public void setO_zipcode(String o_zipcode) {
		this.o_zipcode = o_zipcode;
	}

	public String getO_regdate() {
		return o_regdate;
	}

	public void setO_regdate(String o_regdate) {
		this.o_regdate = o_regdate;
	}

	public String getO_payment() {
		return o_payment;
	}

	public void setO_payment(String o_payment) {
		this.o_payment = o_payment;
	}

	public String getO_remarks() {
		return o_remarks;
	}

	public void setO_remarks(String o_remarks) {
		this.o_remarks = o_remarks;
	}

	public int getI_no() {
		return i_no;
	}

	public void setI_no(int i_no) {
		this.i_no = i_no;
	}

	public String getO_name() {
		return o_name;
	}

	public void setO_name(String o_name) {
		this.o_name = o_name;
	}

	public int getO_pay_amt() {
		return o_pay_amt;
	}

	public void setO_pay_amt(int o_pay_amt) {
		this.o_pay_amt = o_pay_amt;
	}
	
	
}
