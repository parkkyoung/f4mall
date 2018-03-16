package vo;

import org.springframework.web.multipart.MultipartFile;

public class ProductVo {
	int p_no, p_price, p_sale;
	String p_supply, p_content, p_pdate,p_name,
	p_country, p_entry;
	
	MultipartFile [] p_image;
	
	String p_image_m,p_image_s;

	public ProductVo() {
		// TODO Auto-generated constructor stub
	}

	
	
	
	public String getP_image_m() {
		return p_image_m;
	}


	



	public String getP_name() {
		return p_name;
	}




	public void setP_name(String p_name) {
		this.p_name = p_name;
	}




	public void setP_image_m(String p_image_m) {
		this.p_image_m = p_image_m;
	}





	public String getP_image_s() {
		return p_image_s;
	}





	public void setP_image_s(String p_image_s) {
		this.p_image_s = p_image_s;
	}





	public MultipartFile[] getP_image() {
		return p_image;
	}




	public void setP_image(MultipartFile[] p_image) {
		this.p_image = p_image;
	}




	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_supply() {
		return p_supply;
	}

	public void setP_supply(String p_supply) {
		this.p_supply = p_supply;
	}

	

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
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

	public String getP_pdate() {
		return p_pdate;
	}

	public void setP_pdate(String p_pdate) {
		this.p_pdate = p_pdate;
	}

	public String getP_country() {
		return p_country;
	}

	public void setP_country(String p_country) {
		this.p_country = p_country;
	}

	public String getP_entry() {
		return p_entry;
	}

	public void setP_entry(String p_entry) {
		this.p_entry = p_entry;
	}
	
	
}
