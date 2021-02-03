package point.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import movie.MovieDAO;
import movie.MovieVO;
import point.model.dao.PointDao;
import point.model.vo.Point;

public class PointService {

	public Point interestSelect(String memId) {
		Connection conn = getConnection();

		Point point = new PointDao().selectPoint(conn, memId);

		close(conn);

		return point;
	}

}
