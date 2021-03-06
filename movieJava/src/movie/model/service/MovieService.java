package movie.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import movie.model.dao.MovieDAO;
import movie.model.vo.MovieVO;
import movie.model.vo.Search;
import point.model.dao.PointDao;
import point.model.vo.Point;


public class MovieService {
	
	public MovieVO movieSelect(String memId) {
		Connection conn = getConnection();
		
		MovieVO movie = new MovieDAO().selectMovie(conn, memId);
		
		close(conn);
		
		
	return movie;
		
	}
	// 영화검색 
	public ArrayList<MovieVO> selectSearchMovie(Search filter) {
		
		Connection conn = getConnection();
		
		ArrayList<MovieVO> list = new MovieDAO().selectSearchMovie(conn, filter);

		close(conn);
		
		return list;
	}
	
	public ArrayList<MovieVO> selectMovieList(String memId) {
		Connection conn = getConnection();
		ArrayList<MovieVO> mList = new MovieDAO().selectMovieList(conn, memId);
		
		close(conn);
		
		return mList;
	}

}