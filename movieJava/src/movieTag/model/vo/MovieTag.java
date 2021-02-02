package movieTag.model.vo;

public class MovieTag {
	private int tagNo;
	private String tagName;
	private String m_code;			// 영화코드
	private String m_title;			// 영화제목
	private String m_genre;			// 장르
	private String m_director;		// 감독
	private String m_date;			// 개봉연도
	private String m_country;		// 국가
	private String m_image;			// 이미지
	private String m_summary;		// 설명
	private String m_rating;		// 관람등급
	private int m_grade;			// 평점
	private String status;			// 게시여부
	
	public MovieTag() {}

	public MovieTag(int tagNo, String m_code) {
		super();
		this.tagNo = tagNo;
		this.m_code = m_code;
	}
	
	public MovieTag(String tagName, String m_code, String m_title, String m_genre, String m_director, String m_date,
			String m_country, String m_image, String m_summary, String m_rating, int m_grade, String status) {
		super();
		this.tagName = tagName;
		this.m_code = m_code;
		this.m_title = m_title;
		this.m_genre = m_genre;
		this.m_director = m_director;
		this.m_date = m_date;
		this.m_country = m_country;
		this.m_image = m_image;
		this.m_summary = m_summary;
		this.m_rating = m_rating;
		this.m_grade = m_grade;
		this.status = status;
	}

	public MovieTag(int tagNo, String tagName, String m_code, String m_title, String m_genre, String m_director,
			String m_date, String m_country, String m_image, String m_summary, String m_rating, int m_grade,
			String status) {
		super();
		this.tagNo = tagNo;
		this.tagName = tagName;
		this.m_code = m_code;
		this.m_title = m_title;
		this.m_genre = m_genre;
		this.m_director = m_director;
		this.m_date = m_date;
		this.m_country = m_country;
		this.m_image = m_image;
		this.m_summary = m_summary;
		this.m_rating = m_rating;
		this.m_grade = m_grade;
		this.status = status;
	}

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	public String getM_code() {
		return m_code;
	}

	public void setM_code(String m_code) {
		this.m_code = m_code;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public String getM_title() {
		return m_title;
	}

	public void setM_title(String m_title) {
		this.m_title = m_title;
	}

	public String getM_genre() {
		return m_genre;
	}

	public void setM_genre(String m_genre) {
		this.m_genre = m_genre;
	}

	public String getM_director() {
		return m_director;
	}

	public void setM_director(String m_director) {
		this.m_director = m_director;
	}

	public String getM_date() {
		return m_date;
	}

	public void setM_date(String m_date) {
		this.m_date = m_date;
	}

	public String getM_country() {
		return m_country;
	}

	public void setM_country(String m_country) {
		this.m_country = m_country;
	}

	public String getM_image() {
		return m_image;
	}

	public void setM_image(String m_image) {
		this.m_image = m_image;
	}

	public String getM_summary() {
		return m_summary;
	}

	public void setM_summary(String m_summary) {
		this.m_summary = m_summary;
	}

	public String getM_rating() {
		return m_rating;
	}

	public void setM_rating(String m_rating) {
		this.m_rating = m_rating;
	}

	public int getM_grade() {
		return m_grade;
	}

	public void setM_grade(int m_grade) {
		this.m_grade = m_grade;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "MovieTag [tagNo=" + tagNo + ", tagName=" + tagName + ", m_code=" + m_code + ", m_title=" + m_title
				+ ", m_genre=" + m_genre + ", m_director=" + m_director + ", m_date=" + m_date + ", m_country="
				+ m_country + ", m_image=" + m_image + ", m_summary=" + m_summary + ", m_rating=" + m_rating
				+ ", m_grade=" + m_grade + ", status=" + status + "]";
	}

}
