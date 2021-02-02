package store.model.vo;

public class Store {
	private int storeNo;
	private String storeContent;
	private String storeTitle;
	private String storePrice;	// sql developer에 varchar2 타입
	private int storeQuantity;
	private String storePath;
	private String originName;
	private String rename;
	private int stCategory;
	private int selQuan;	// 판매 수량
	
	public Store() {}

	public Store(int storeNo, String storeContent, String storeTitle, String storePrice, int storeQuantity,
			String storePath, String originName, String rename, int stCategory) {
		super();
		this.storeNo = storeNo;
		this.storeContent = storeContent;
		this.storeTitle = storeTitle;
		this.storePrice = storePrice;
		this.storeQuantity = storeQuantity;
		this.storePath = storePath;
		this.originName = originName;
		this.rename = rename;
		this.stCategory = stCategory;
	}

	public Store(int storeNo, String storeContent, String storeTitle, String storePrice, int storeQuantity,
			String storePath, String originName, String rename, int stCategory, int selQuan) {
		super();
		this.storeNo = storeNo;
		this.storeContent = storeContent;
		this.storeTitle = storeTitle;
		this.storePrice = storePrice;
		this.storeQuantity = storeQuantity;
		this.storePath = storePath;
		this.originName = originName;
		this.rename = rename;
		this.stCategory = stCategory;
		this.selQuan = selQuan;
	}

	public Store(int storeNo, String storeContent, String storeTitle, String storePrice, int storeQuantity,
			String storePath, String originName, String rename, int stCategory) {
		super();
		this.storeNo = storeNo;
		this.storeContent = storeContent;
		this.storeTitle = storeTitle;
		this.storePrice = storePrice;
		this.storeQuantity = storeQuantity;
		this.storePath = storePath;
		this.originName = originName;
		this.rename = rename;
		this.stCategory = stCategory;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public String getStoreContent() {
		return storeContent;
	}

	public void setStoreContent(String storeContent) {
		this.storeContent = storeContent;
	}

	public String getStoreTitle() {
		return storeTitle;
	}

	public void setStoreTitle(String storeTitle) {
		this.storeTitle = storeTitle;
	}

	public String getStorePrice() {
		return storePrice;
	}

	public void setStorePrice(String storePrice) {
		this.storePrice = storePrice;
	}

	public int getStoreQuantity() {
		return storeQuantity;
	}

	public void setStoreQuantity(int storeQuantity) {
		this.storeQuantity = storeQuantity;
	}

	public String getStorePath() {
		return storePath;
	}

	public void setStorePath(String storePath) {
		this.storePath = storePath;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getRename() {
		return rename;
	}

	public void setRename(String rename) {
		this.rename = rename;
	}

	public int getStCategory() {
		return stCategory;
	}

	public void setStCategory(int stCategory) {
		this.stCategory = stCategory;
	}

	public int getSelQuan() {
		return selQuan;
	}

	public void setSelQuan(int selQuan) {
		this.selQuan = selQuan;
	}

	@Override
	public String toString() {
		return "Store [storeNo=" + storeNo + ", storeContent=" + storeContent + ", storeTitle=" + storeTitle
				+ ", storePrice=" + storePrice + ", storeQuantity=" + storeQuantity + ", storePath=" + storePath
				+ ", originName=" + originName + ", rename=" + rename + ", stCategory=" + stCategory + ", selQuan="
				+ selQuan + "]";
	}

	
	
	
}
