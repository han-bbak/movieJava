package movie.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import movie.model.dao.MovieDAO;
import movie.model.vo.MovieVO;
import movie.model.vo.Search;

public class MovieSearchService {

	public ArrayList<MovieVO> selectSearchMovie(Search filter) {
		
		Connection conn = getConnection();
		
		ArrayList<MovieVO> list = new MovieDAO().selectSearchMovie(conn, filter);

		close(conn);
		
		return list;
	}

}
