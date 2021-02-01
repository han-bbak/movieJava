package payment.model.vo;

import java.sql.Date;

public class Payment {

	private int payCode;
	private String payCard;
	private int payCardNo;
	private Date payDate;
	private int payNum;
	
	public Payment() {}

	public Payment(int payCode, String payCard, int payCardNo, Date payDate, int payNum) {
		super();
		this.payCode = payCode;
		this.payCard = payCard;
		this.payCardNo = payCardNo;
		this.payDate = payDate;
		this.payNum = payNum;
	}

	public int getPayCode() {
		return payCode;
	}

	public void setPayCode(int payCode) {
		this.payCode = payCode;
	}

	public String getPayCard() {
		return payCard;
	}

	public void setPayCard(String payCard) {
		this.payCard = payCard;
	}

	public int getPayCardNo() {
		return payCardNo;
	}

	public void setPayCardNo(int payCardNo) {
		this.payCardNo = payCardNo;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public int getPayNum() {
		return payNum;
	}

	public void setPayNum(int payNum) {
		this.payNum = payNum;
	}

	
	
	
}
