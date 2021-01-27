package tag.model.vo;

import java.sql.Date;

public class Tag {
	private int tagNo;
	private String tagName;
	private Date register_date;
	private String tagStatus;
	
	public Tag() {}

	public Tag(int tagNo, String tagName, Date register_date, String tagStatus) {
		super();
		this.tagNo = tagNo;
		this.tagName = tagName;
		this.register_date = register_date;
		this.tagStatus = tagStatus;
	}

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public Date getRegister_date() {
		return register_date;
	}

	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}

	public String getTagStatus() {
		return tagStatus;
	}

	public void setTagStatus(String tagStatus) {
		this.tagStatus = tagStatus;
	}

	@Override
	public String toString() {
		return "Tag [tagNo=" + tagNo + ", tagName=" + tagName + ", register_date=" + register_date + ", tagStatus="
				+ tagStatus + "]";
	}
	
}
