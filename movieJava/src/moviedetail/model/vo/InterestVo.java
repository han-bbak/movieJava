package moviedetail.model.vo;

public class InterestVo {
//	MEM_NO
//	M_CODE
	private int mem_no; 
	private String m_code; 
	
	public InterestVo() {}

	public InterestVo(int mem_no, String m_code) {
		super();
		this.mem_no = mem_no;
		this.m_code = m_code;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public String getM_code() {
		return m_code;
	}

	public void setM_code(String m_code) {
		this.m_code = m_code;
	}

	@Override
	public String toString() {
		return "InterestVo [mem_no=" + mem_no + ", m_code=" + m_code + "]";
	}

	
}
