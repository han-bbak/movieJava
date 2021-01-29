package qaAnswer.model.vo;

import java.sql.Date;

public class QAAnswer {
	private int ansNo;
	private String ansContent;
	private Date ansDate;
	private Date andModifyDate;
	private String ansWriter;
	private int brdNo;
	
	public QAAnswer() {}

	public QAAnswer(String ansContent, int brdNo) {
		super();
		this.ansContent = ansContent;
		this.brdNo = brdNo;
	}

	public QAAnswer(int ansNo, String ansContent, Date ansDate, Date andModifyDate, String ansWriter, int brdNo) {
		super();
		this.ansNo = ansNo;
		this.ansContent = ansContent;
		this.ansDate = ansDate;
		this.andModifyDate = andModifyDate;
		this.ansWriter = ansWriter;
		this.brdNo = brdNo;
	}

	public int getAnsNo() {
		return ansNo;
	}

	public void setAnsNo(int ansNo) {
		this.ansNo = ansNo;
	}

	public String getAnsContent() {
		return ansContent;
	}

	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}

	public Date getAnsDate() {
		return ansDate;
	}

	public void setAnsDate(Date ansDate) {
		this.ansDate = ansDate;
	}

	public Date getAndModifyDate() {
		return andModifyDate;
	}

	public void setAndModifyDate(Date andModifyDate) {
		this.andModifyDate = andModifyDate;
	}

	public String getAnsWriter() {
		return ansWriter;
	}

	public void setAnsWriter(String ansWriter) {
		this.ansWriter = ansWriter;
	}

	public int getBrdNo() {
		return brdNo;
	}

	public void setBrdNo(int brdNo) {
		this.brdNo = brdNo;
	}

	@Override
	public String toString() {
		return "QAAnswer [ansNo=" + ansNo + ", ansContent=" + ansContent + ", ansDate=" + ansDate + ", andModifyDate="
				+ andModifyDate + ", ansWriter=" + ansWriter + ", brdNo=" + brdNo + "]";
	}
	
}
