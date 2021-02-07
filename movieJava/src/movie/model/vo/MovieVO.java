package movie.model.vo;

public class MovieVO {
	private String m_code;			// 영화코드
	private String m_title;			// 영화제목
	private String m_genre;			// 장르
	private String m_director;		// 감독
	private String m_date;			// 개봉연도
	private String m_country;		// 국가
	private String m_image;			// 이미지
	private String m_summary;		// 설명
	private String m_rating;		// 관람등급
	private double m_grade;			// 평점
	private String status;			// 넷플릭스 서비스 여부
	
	public MovieVO() {
	}

	public MovieVO(String m_title, String status) {
		super();
		this.m_title = m_title;
		this.status = status;
	}

	public MovieVO(String m_code, String m_title, String m_genre, String m_director, String m_date, String m_country,
			String m_image, String m_summary, String m_rating, double m_grade, String status) {
		super();
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

	public String getM_code() {
		return m_code;
	}

	public void setM_code(String m_code) {
		this.m_code = m_code;
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

	public double getM_grade() {
		return m_grade;
	}

	public void setM_grade(double m_grade) {
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
		return "MovieVO [m_code=" + m_code + ", m_title=" + m_title + ", m_genre=" + m_genre + ", m_director="
				+ m_director + ", m_date=" + m_date + ", m_country=" + m_country + ", m_image=" + m_image
				+ ", m_summary=" + m_summary + ", m_rating=" + m_rating + ", m_grade=" + m_grade + ", status=" + status
				+ "]";
	}
	
	

}
