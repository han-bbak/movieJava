package orderList.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import orderList.model.vo.OrderList;
import payment.model.vo.Payment;

public class OrderListDao {
	private Properties prop = new Properties();

	public OrderListDao() {
		String fileName = OrderListDao.class.getResource("/sql/member/member-query.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public OrderList selectOrderList(Connection conn, String memId) {

		OrderList orderList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("orderListselect");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				orderList = new OrderList(rset.getInt("ORD_NO"), rset.getInt("ORD_QUANTITY"), rset.getInt("ST_NO"),
						rset.getInt("PAY_CODE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return orderList;
	}
}
