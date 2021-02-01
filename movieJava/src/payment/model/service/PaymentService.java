package payment.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import payment.model.dao.PaymentDao;
import payment.model.vo.Payment;

public class PaymentService {

	public Payment paymentSelect(String memId) {
		Connection conn = getConnection();
		
		Payment pay = new PaymentDao().selectPayment(conn, memId);
		
		close(conn);
		
		return pay;
	}
}
