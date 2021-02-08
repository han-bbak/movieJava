package moviedetail.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static common.JDBCTemplate.close;

import interest.model.vo.Interest;

public class InterestDao {
	private Properties prop = new Properties();

	public InterestDao() {

		String fileName = InterestDao.class.getResource("/sql/movie/movie-query.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	       
	   public int insertInterest(Connection conn, int mem_no, String m_code) {	
	    int result=0;
	  
		   PreparedStatement pstmt = null;
	      String sql = prop.getProperty("insertInterest");
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
//	     	private int mem_no; 
//	    	private String m_code; 
//	    	
	         pstmt.setInt(1, mem_no);
	         pstmt.setString(2, m_code);
	         
	         
	         result = pstmt.executeUpdate();
	        
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	      return result;
	   }
}
