package board.model.vo;

import java.sql.Date;

public class Reply {
	private int rp_no;	// 댓글 번호
	private String rp_content;
	private String mem_name;
	private String rp_writer;	// 댓글 작성자
	private Date rp_date;
	private Date rp_modify;
	private String rp_status;
	private String rp_privacy;	// 비밀 댓글 여부
	private int brd_no;	// 작성한 댓글의 글 번호
	
	public Reply() {}

	public Reply(int rp_no, String rp_content, String mem_name, String rp_writer, Date rp_date, Date rp_modify,
			String rp_status, String rp_privacy, int brd_no) {
		super();
		this.rp_no = rp_no;
		this.rp_content = rp_content;
		this.mem_name = mem_name;
		this.rp_writer = rp_writer;
		this.rp_date = rp_date;
		this.rp_modify = rp_modify;
		this.rp_status = rp_status;
		this.rp_privacy = rp_privacy;
		this.brd_no = brd_no;
	}

	public int getRp_no() {
		return rp_no;
	}

	public void setRp_no(int rp_no) {
		this.rp_no = rp_no;
	}

	public String getRp_content() {
		return rp_content;
	}

	public void setRp_content(String rp_content) {
		this.rp_content = rp_content;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getRp_writer() {
		return rp_writer;
	}

	public void setRp_writer(String rp_writer) {
		this.rp_writer = rp_writer;
	}

	public Date getRp_date() {
		return rp_date;
	}

	public void setRp_date(Date rp_date) {
		this.rp_date = rp_date;
	}

	public Date getRp_modify() {
		return rp_modify;
	}

	public void setRp_modify(Date rp_modify) {
		this.rp_modify = rp_modify;
	}

	public String getRp_status() {
		return rp_status;
	}

	public void setRp_status(String rp_status) {
		this.rp_status = rp_status;
	}

	public String getRp_privacy() {
		return rp_privacy;
	}

	public void setRp_privacy(String rp_privacy) {
		this.rp_privacy = rp_privacy;
	}

	public int getBrd_no() {
		return brd_no;
	}

	public void setBrd_no(int brd_no) {
		this.brd_no = brd_no;
	}

	@Override
	public String toString() {
		return "Reply [rp_no=" + rp_no + ", rp_content=" + rp_content + ", mem_name=" + mem_name + ", rp_writer="
				+ rp_writer + ", rp_date=" + rp_date + ", rp_modify=" + rp_modify + ", rp_status=" + rp_status
				+ ", rp_privacy=" + rp_privacy + ", brd_no=" + brd_no + "]";
	}
	
	

}