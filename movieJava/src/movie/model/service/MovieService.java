package movie.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import movie.model.dao.MovieDAO;
import movie.model.vo.MovieVO;
import movie.model.vo.Search;


public class MovieService {

	public MovieVO movieSelect(String memId) {
		Connection conn = getConnection();
		
		MovieVO movie = new MovieDAO().selectMovie(conn, memId);
		
		close(conn);
		
		
	return movie;
		
	}

}