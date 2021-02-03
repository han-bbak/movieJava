package moviedetail.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static common.JDBCTemplate.close;
import board.model.dao.BoardDao;
import movie.model.vo.MovieVO;

public class MovieDao {
	private Properties prop = new Properties();

	public MovieDao() {
		String fileName = BoardDao.class.getResource("/sql/movie/movie-query.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public MovieVO selectMovie(Connection conn, String mCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMovie");
		MovieVO movie = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mCode);
			rset = pstmt.executeQuery();
			/*M_CODE	VARCHAR2(30 BYTE)
M_TITLE	VARCHAR2(50 BYTE)
M_GENRE	VARCHAR2(50 BYTE)
M_DIRECTOR	VARCHAR2(50 BYTE)
M_DATE	VARCHAR2(5 BYTE)
M_COUNTRY	VARCHAR2(30 BYTE)
M_IMAGE	VARCHAR2(256 BYTE)
M_SUMMARY	VARCHAR2(2500 BYTE)
M_RATING	VARCHAR2(50 BYTE)
M_GRADE	NUMBER(38,0)
STATUS	VARCHAR2(20 BYTE)*/
			if(rset.next()) {
				movie = new MovieVO(rset.getString("m_code"),
								    rset.getString("m_title"),
								    rset.getString("m_genre"),
								    rset.getString("m_director"),
								    rset.getString("m_date"),
								    rset.getString("m_country"),
								    rset.getString("m_image"),
								    rset.getString("m_summary"),
								    rset.getString("m_rating"),
								    rset.getInt("m_grade"),
								    rset.getString("status"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return movie;
	}

	public int insertStarGrade(Connection conn, int stargrade, String movievo, int memberno) {
		 int result=0; 
		 PreparedStatement pstmt = null; 
		 String sql= prop.getProperty("insertStarGrade");
		 
		 try {
			 pstmt=conn.prepareStatement(sql);
			 
			 pstmt.setInt(1,memberno);
			 pstmt.setString(2,movievo);
			 pstmt.setInt(3,stargrade);
			 result=pstmt.executeUpdate(); 
		 }catch 
		 (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		 
		
	}

}
