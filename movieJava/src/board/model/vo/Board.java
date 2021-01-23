package board.model.vo;

import java.sql.Date;

public class Board {
	private int brd_no;				// 글 번호
	private int brd_category;		// 카테고리 (왓챠, 넷플릭스, Q&A)
	private String brd_title;		// 제목
	private String brd_content;		// 내용
	private int mem_no;				// 작성자 회원 번호 (member - mem_no 참조)
	private String brd_writer;		// 작성자 이름
	private int brd_cnt;			// 조회수
	private Date brd_date;			// 작성일
	private Date brd_modify;		// 수정일
	private String brd_status;		// 활성화
	
	public Board() {}

	public Board(int brd_no, int brd_category, String brd_title, String brd_content, int mem_no, String brd_writer,
			int brd_cnt, Date brd_date, Date brd_modify, String brd_status) {
		super();
		this.brd_no = brd_no;
		this.brd_category = brd_category;
		this.brd_title = brd_title;
		this.brd_content = brd_content;
		this.mem_no = mem_no;
		this.brd_writer = brd_writer;
		this.brd_cnt = brd_cnt;
		this.brd_date = brd_date;
		this.brd_modify = brd_modify;
		this.brd_status = brd_status;
	}

	public Board(int brd_no, int brd_category, String brd_title, String brd_content, String brd_writer, int brd_cnt,
			Date brd_date, Date brd_modify, String brd_status) {
		super();
		this.brd_no = brd_no;
		this.brd_category = brd_category;
		this.brd_title = brd_title;
		this.brd_content = brd_content;
		this.brd_writer = brd_writer;
		this.brd_cnt = brd_cnt;
		this.brd_date = brd_date;
		this.brd_modify = brd_modify;
		this.brd_status = brd_status;
	}


	public int getBrd_no() {
		return brd_no;
	}

	public void setBrd_no(int brd_no) {
		this.brd_no = brd_no;
	}

	public int getBrd_category() {
		return brd_category;
	}

	public void setBrd_category(int brd_category) {
		this.brd_category = brd_category;
	}

	public String getBrd_title() {
		return brd_title;
	}

	public void setBrd_title(String brd_title) {
		this.brd_title = brd_title;
	}

	public String getBrd_content() {
		return brd_content;
	}

	public void setBrd_content(String brd_content) {
		this.brd_content = brd_content;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public String getBrd_writer() {
		return brd_writer;
	}

	public void setBrd_writer(String brd_writer) {
		this.brd_writer = brd_writer;
	}

	public int getBrd_cnt() {
		return brd_cnt;
	}

	public void setBrd_cnt(int brd_cnt) {
		this.brd_cnt = brd_cnt;
	}

	public Date getBrd_date() {
		return brd_date;
	}

	public void setBrd_date(Date brd_date) {
		this.brd_date = brd_date;
	}

	public Date getBrd_modify() {
		return brd_modify;
	}

	public void setBrd_modify(Date brd_modify) {
		this.brd_modify = brd_modify;
	}

	public String getBrd_status() {
		return brd_status;
	}

	public void setBrd_status(String brd_status) {
		this.brd_status = brd_status;
	}

	@Override
	public String toString() {
		return "Board [brd_no=" + brd_no + ", brd_category=" + brd_category + ", brd_title=" + brd_title
				+ ", brd_content=" + brd_content + ", mem_no=" + mem_no + ", brd_writer=" + brd_writer + ", brd_cnt="
				+ brd_cnt + ", brd_date=" + brd_date + ", brd_modify=" + brd_modify + ", brd_status=" + brd_status
				+ "]";
	}
	
	

}
