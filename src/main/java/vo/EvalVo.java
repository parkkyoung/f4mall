package vo;

public class EvalVo {
	int eval_no, p_no, eval_score;
	String m_id, eval_title, 
		   eval_content, eval_ip, 
		   eval_regdate;
	int i_no, o_status;
	
	
	public int getI_no() {
		return i_no;
	}

	public void setI_no(int i_no) {
		this.i_no = i_no;
	}

	public int getO_status() {
		return o_status;
	}

	public void setO_status(int o_status) {
		this.o_status = o_status;
	}

	public EvalVo() {
		// TODO Auto-generated constructor stub
	}

	public int getEval_no() {
		return eval_no;
	}

	public void setEval_no(int eval_no) {
		this.eval_no = eval_no;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public int getEval_score() {
		return eval_score;
	}

	public void setEval_score(int eval_score) {
		this.eval_score = eval_score;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getEval_title() {
		return eval_title;
	}

	public void setEval_title(String eval_title) {
		this.eval_title = eval_title;
	}

	public String getEval_content() {
		return eval_content;
	}

	public void setEval_content(String eval_content) {
		this.eval_content = eval_content;
	}

	public String getEval_ip() {
		return eval_ip;
	}

	public void setEval_ip(String eval_ip) {
		this.eval_ip = eval_ip;
	}

	public String getEval_regdate() {
		return eval_regdate;
	}

	public void setEval_regdate(String eval_regdate) {
		this.eval_regdate = eval_regdate;
	}
	
	
	
}
