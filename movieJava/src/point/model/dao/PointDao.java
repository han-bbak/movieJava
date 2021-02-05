package point.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import board.model.vo.Reply;
import interest.model.vo.Interest;
import member.model.dao.MemberDao;
import point.model.vo.Point;

public class PointDao {
	private Properties prop = new Properties();

	public PointDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	public Point selectPoint(Connection conn, String memId) {
		Point point = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("pointselect");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				point = new Point(rset.getInt("PNT_CODE"),
						rset.getInt("PNT_LIST"),
						rset.getDate("PNT_DATE"),
						rset.getInt("MEM_NO"),
						rset.getInt("PAY_CODE"),
						rset.getInt("REVIEW_NO"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return point;
	}
	public ArrayList<Point> selectReplyList(Connection conn, String memId) {
		
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<Point> pList = new ArrayList<Point>();
			String sql = prop.getProperty("selectPointList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memId);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					pList.add(new Point(rset.getInt("PNT_CODE"),
							rset.getInt("PNT_LIST"),
							rset.getDate("PNT_DATE"),
							rset.getInt("MEM_NO"),
							rset.getInt("PAY_CODE"),
							rset.getInt("REVIEW_NO")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return pList;
		}
	}


