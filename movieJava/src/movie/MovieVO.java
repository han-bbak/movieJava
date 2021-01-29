package movie;

public class MovieVO {
	private String M_CODE;
	private String M_TITLE;
	private String M_GENRE;
	private String M_DIRECTOR;
	private String M_DATE;
	private String M_COUNTRY;
	private String M_IMAGE;
	private String M_SUMMARY;
	private String M_RATING;
	private int M_GRADE;
	private String STATUS;

	public MovieVO() {
	}

	public MovieVO (String m_CODE, String m_TITLE, String m_GENRE, String m_DIRECTOR, String m_DATE, String m_COUNTRY,
			String m_IMAGE, String m_SUMMARY, String m_RATING, int m_GRADE, String sTATUS) {
		super();
		M_CODE = m_CODE;
		M_TITLE = m_TITLE;
		M_GENRE = m_GENRE;
		M_DIRECTOR = m_DIRECTOR;
		M_DATE = m_DATE;
		M_COUNTRY = m_COUNTRY;
		M_IMAGE = m_IMAGE;
		M_SUMMARY = m_SUMMARY;
		M_RATING = m_RATING;
		M_GRADE = m_GRADE;
		STATUS = sTATUS;
	}

	public String getM_CODE() {
		return M_CODE;
	}

	public void setM_CODE(String m_CODE) {
		M_CODE = m_CODE;
	}

	public String getM_TITLE() {
		return M_TITLE;
	}

	public void setM_TITLE(String m_TITLE) {
		M_TITLE = m_TITLE;
	}

	public String getM_GENRE() {
		return M_GENRE;
	}

	public void setM_GENRE(String m_GENRE) {
		M_GENRE = m_GENRE;
	}

	public String getM_DIRECTOR() {
		return M_DIRECTOR;
	}

	public void setM_DIRECTOR(String m_DIRECTOR) {
		M_DIRECTOR = m_DIRECTOR;
	}

	public String getM_DATE() {
		return M_DATE;
	}

	public void setM_DATE(String m_DATE) {
		M_DATE = m_DATE;
	}

	public String getM_COUNTRY() {
		return M_COUNTRY;
	}

	public void setM_COUNTRY(String m_COUNTRY) {
		M_COUNTRY = m_COUNTRY;
	}

	public String getM_IMAGE() {
		return M_IMAGE;
	}

	public void setM_IMAGE(String m_IMAGE) {
		M_IMAGE = m_IMAGE;
	}

	public String getM_SUMMARY() {
		return M_SUMMARY;
	}

	public void setM_SUMMARY(String m_SUMMARY) {
		M_SUMMARY = m_SUMMARY;
	}

	public String getM_RATING() {
		return M_RATING;
	}

	public void setM_RATING(String m_RATING) {
		M_RATING = m_RATING;
	}

	public int getM_GRADE() {
		return M_GRADE;
	}

	public void setM_GRADE(int m_GRADE) {
		M_GRADE = m_GRADE;
	}

	public String getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}

	@Override
	public String toString() {
		return "MovieVO [M_CODE=" + M_CODE + ", M_TITLE=" + M_TITLE + ", M_GENRE=" + M_GENRE + ", M_DIRECTOR="
				+ M_DIRECTOR + ", M_DATE=" + M_DATE + ", M_COUNTRY=" + M_COUNTRY + ", M_IMAGE=" + M_IMAGE
				+ ", M_SUMMARY=" + M_SUMMARY + ", M_RATING=" + M_RATING + ", M_GRADE=" + M_GRADE + ", STATUS=" + STATUS
				+ "]";
	}

}
