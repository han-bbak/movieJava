package orderList.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import orderList.model.dao.OrderListDao;
import orderList.model.vo.OrderList;
import payment.model.dao.PaymentDao;
import payment.model.vo.Payment;

public class OrderListService {

	public OrderList orderListSelect(String memId) {
		
			Connection conn = getConnection();
			
			OrderList orderList = new OrderListDao().selectOrderList(conn, memId);
			
			close(conn);
			
			
		return orderList;
	}

}
