package vo;

public class CartVo {
	int car_no, p_no, cart_amt;
	String m_id, cart_regdate;
	String p_image_s, p_name;
	int p_price,p_sale;
	String m_name,m_addr,m_addr_d;
	
	public CartVo() {
		// TODO Auto-generated constructor stub
	}
	
	public int getCar_no() {
		return car_no;
	}
	public void setCar_no(int car_no) {
		this.car_no = car_no;
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
