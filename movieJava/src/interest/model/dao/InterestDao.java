package interest.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import interest.model.vo.Interest;
import member.model.dao.MemberDao;

public class InterestDao {
	private Properties prop = new Properties();

	public InterestDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public Interest selectInterest(Connection conn, String memId) {
		Interest interest = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("interestselect");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				interest = new Interest(rset.getInt("MEM_NO"), rset.getString("M_CODE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return interest;
	}
}
