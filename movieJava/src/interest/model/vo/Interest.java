package interest.model.vo;

public class Interest {

	private int memNo;
	private String mCode;
	
	public Interest() {}

	public Interest(int memNo, String mCode) {
		super();
		this.memNo = memNo;
		this.mCode = mCode;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getmCode() {
		return mCode;
	}

	public void setmCode(String mCode) {
		this.mCode = mCode;
	}

	@Override
	public String toString() {
		return "Interest [memNo=" + memNo + ", mCode=" + mCode + "]";
	}
	
	
}
