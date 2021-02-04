package point.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import movie.model.dao.MovieDAO;
import movie.model.vo.MovieVO;
import point.model.dao.PointDao;
import point.model.vo.Point;

public class PointService {

	public Point interestSelect(String memId) {
		Connection conn = getConnection();

		Point point = new PointDao().selectPoint(conn, memId);

		close(conn);

		return point;
	}

	

	public Point pointListSelect(String memId) {
		// TODO Auto-generated method stub
		return null;
	}

}
