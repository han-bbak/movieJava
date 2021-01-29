package movie;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import member.model.vo.Member;

public class MovieDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;

	public ArrayList<MovieVO> getList (String movies, String searchType, String search, int pageNumber){
		if(movies.equals("전체")) {
			movies= ""; //항상 포함
		}
		ArrayList<MovieVO> movieList = null;
		Member loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "";
		
		try {
			if(searchType.equals("추천순")) {
				sql = "SELECT * FROM MOVIE WHERE movies LIKE ? AND CONCAT(M_TITLE,M_DIRECTOR) LIKE"
						+ "? ORDER BY M_RATING DESC";
			}else if(searchType.equals("최신개봉순")) {
				sql = "SELECT * FROM MOVIE ? ORDER BY M_DATE DESC";
			
//			conn = ?.getConnection
//			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + movies + "%");
			pstmt.setString(2, "%" + search + "%");
			rset = pstmt.executeQuery();
			movieList = new ArrayList<MovieVO>();
/*			while(rset.next()) {
				MovieVO searchResult = new MovieVO(rset.getString(1),
							                rset.getString(2),
							                rset.getString(3),
							                rset.getString(4),
							                rset.getString(5),
							                rset.getString(6),
							                rset.getString(7),
							                rset.getString(8),
							                rset.getString(9),
							                rset.getNumber(10),
							                rset.getString(11)
				};
				movieList.add(searchResult);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {*/
			close(rset);
			close(pstmt);
		}
		
		return movieList;
		}
}
}

