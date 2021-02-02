package interest.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import interest.model.dao.InterestDao;
import interest.model.vo.Interest;

public class InterestService {

	public Interest interestSelect(String memId) {
		Connection conn = getConnection();

		Interest interest = new InterestDao().selectInterest(conn, memId);

		close(conn);

		return interest;
	}

}
