package moviedetail.model.service;

import java.sql.Connection;
import static common.JDBCTemplate.*;
import movie.MovieVO;
import moviedetail.model.dao.MovieDao;

public class MovieService {

	public MovieVO selectMovie(String mCode) {
		Connection conn = getConnection();
		
		MovieVO movie = new MovieDao().selectMovie(conn, mCode);
		
		close(conn);
		
		return movie;
	}

}
