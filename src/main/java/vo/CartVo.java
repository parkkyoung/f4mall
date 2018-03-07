package vo;

public class CartVo {
	int cart_no, p_no, cart_amt;
	String m_id, cart_regdate;
	String p_image_s, p_name;
	int p_price,p_sale;
	String m_name,m_addr,m_addr_d;
	
	public String getP_image_s() {
		return p_image_s;
	}

	public void setP_image_s(String p_image_s) {
		this.p_image_s = p_image_s;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public int getP_sale() {
		return p_sale;
	}

	public void setP_sale(int p_sale) {
		this.p_sale = p_sale;
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

	public CartVo() {
		// TODO Auto-generated constructor stub
	}
	
	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}

	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public int getCart_amt() {
		return cart_amt;
	}
	public void setCart_amt(int cart_amt) {
		this.cart_amt = cart_amt;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getCart_regdate() {
		return cart_regdate;
	}
	public void setCart_regdate(String cart_regdate) {
		this.cart_regdate = cart_regdate;
	}
	
	
}
