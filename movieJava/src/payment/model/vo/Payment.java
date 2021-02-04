package payment.model.vo;

import java.sql.Date;

public class Payment {

	private int ord_no;
	private int payCode;
	private String payCard;
	private int payCardNo;
	private Date payDate;
	private int payNum;
	private String st_title;
	private int ord_quantity;
	private int price;
	private String mem_id;
	private String mem_name;
	
	public Payment() {}

	public Payment(int payCode, String payCard, int payCardNo, Date payDate, int payNum) {
		super();
		this.payCode = payCode;
		this.payCard = payCard;
		this.payCardNo = payCardNo;
		this.payDate = payDate;
		this.payNum = payNum;
	}
	

	public Payment(int ord_no, String payCard, Date payDate, String st_title, int ord_quantity, int price, String mem_id,
			String mem_name) {
		super();
		this.ord_no = ord_no;
		this.payCard = payCard;
		this.payDate = payDate;
		this.st_title = st_title;
		this.ord_quantity = ord_quantity;
		this.price = price;
		this.mem_id = mem_id;
		this.mem_name = mem_name;
	}
	
	public int getOrd_no() {
		return ord_no;
	}

	public void setOrd_no(int ord_no) {
		this.ord_no = ord_no;
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

	public String getSt_title() {
		return st_title;
	}

	public void setSt_title(String st_title) {
		this.st_title = st_title;
	}

	public int getOrd_quantity() {
		return ord_quantity;
	}

	public void setOrd_quantity(int ord_quantity) {
		this.ord_quantity = ord_quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	
	
	
}
