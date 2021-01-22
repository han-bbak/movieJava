package member.model.vo;

import java.sql.Date;

public class Member {
	private int memNo;
	private String memId;
	private String memPwd;
	private String memName;
	private String memBirth;
	private String email;
	private String phone;
	private String address;
	private int point;
	private String grade;
	private Date entDate;
	private Date modifyDate;
	private String memStatus;
	
	public Member() {}
	
	public Member(String memId, String memPwd) {
		super();
		this.memId = memId;
		this.memPwd = memPwd;
	}

	public Member(int memNo, String memId, String memPwd, String memName, String memBirth, String email, String phone,
			String address, int point, String grade, Date entDate, Date modifyDate, String memStatus) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.memBirth = memBirth;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.point = point;
		this.grade = grade;
		this.entDate = entDate;
		this.modifyDate = modifyDate;
		this.memStatus = memStatus;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemBirth() {
		return memBirth;
	}

	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public Date getEntDate() {
		return entDate;
	}

	public void setEntDate(Date entDate) {
		this.entDate = entDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getMemStatus() {
		return memStatus;
	}

	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}

	@Override
	public String toString() {
		return "Member [memNo=" + memNo + ", memId=" + memId + ", memPwd=" + memPwd + ", memName=" + memName
				+ ", memBirth=" + memBirth + ", email=" + email + ", phone=" + phone + ", address=" + address
				+ ", point=" + point + ", grade=" + grade + ", entDate=" + entDate + ", modifyDate=" + modifyDate
				+ ", memStatus=" + memStatus + "]";
	}
	
}
