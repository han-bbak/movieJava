package orderList.model.vo;

public class OrderList {

	private int ordNo;
	private int ordQuantity;
	private int stNo;
	private int payCode;
	
	public OrderList() {}

	public OrderList(int ordNo, int ordQuantity, int stNo, int payCode) {
		super();
		this.ordNo = ordNo;
		this.ordQuantity = ordQuantity;
		this.stNo = stNo;
		this.payCode = payCode;
	}

	public int getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(int ordNo) {
		this.ordNo = ordNo;
	}

	public int getOrdQuantity() {
		return ordQuantity;
	}

	public void setOrdQuantity(int ordQuantity) {
		this.ordQuantity = ordQuantity;
	}

	public int getStNo() {
		return stNo;
	}

	public void setStNo(int stNo) {
		this.stNo = stNo;
	}

	public int getPayCode() {
		return payCode;
	}

	public void setPayCode(int payCode) {
		this.payCode = payCode;
	}

	@Override
	public String toString() {
		return "OrderList [ordNo=" + ordNo + ", ordQuantity=" + ordQuantity + ", stNo=" + stNo + ", payCode=" + payCode
				+ "]";
	}
	
	
}
