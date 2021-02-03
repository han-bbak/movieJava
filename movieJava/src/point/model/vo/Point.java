package point.model.vo;

import java.sql.Date;

public class Point {

	private int putCode;
	private int pntList;
	private Date pntDate;
	private int memNo;
	private int payCode;
	private int reviewNo;
	public Point(int putCode, int pntList, Date pntDate, int memNo, int payCode, int reviewNo) {
		super();
		this.putCode = putCode;
		this.pntList = pntList;
		this.pntDate = pntDate;
		this.memNo = memNo;
		this.payCode = payCode;
		this.reviewNo = reviewNo;
	}
	
	public Point() {}

	public int getPutCode() {
		return putCode;
	}

	public void setPutCode(int putCode) {
		this.putCode = putCode;
	}

	public int getPntList() {
		return pntList;
	}

	public void setPntList(int pntList) {
		this.pntList = pntList;
	}

	public Date getPntDate() {
		return pntDate;
	}

	public void setPntDate(Date pntDate) {
		this.pntDate = pntDate;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getPayCode() {
		return payCode;
	}

	public void setPayCode(int payCode) {
		this.payCode = payCode;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	@Override
	public String toString() {
		return "Point [putCode=" + putCode + ", pntList=" + pntList + ", pntDate=" + pntDate + ", memNo=" + memNo
				+ ", payCode=" + payCode + ", reviewNo=" + reviewNo + "]";
	}
	
	
}
