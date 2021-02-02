package movie.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import movie.MovieDAO;
import movie.MovieVO;


public class MovieService {

	public MovieVO movieSelect(String memId) {
		Connection conn = getConnection();
		
		MovieVO movie = new MovieDAO().selectMovie(conn, memId);
		
		close(conn);
		
		
	return movie;
		
	}

}
