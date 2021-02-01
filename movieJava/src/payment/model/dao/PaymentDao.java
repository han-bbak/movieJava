package payment.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import member.model.dao.MemberDao;
import payment.model.vo.Payment;

public class PaymentDao {
	private Properties prop = new Properties();
	public PaymentDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	public Payment selectPayment(Connection conn, String userId) {

		Payment pay = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("paymentselect");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				pay = new Payment(rset.getInt("MEM_NO"), rset.getString("PAY_CARD"), rset.getInt("PAY_CARDNO"),
						rset.getDate("PAY_DATE"), rset.getInt("PAY_CODE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return pay;
	}
	
}
