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
      //  Stargrade에 불러올 테이블들을 (int stargrade, String movievo, int memberno)가져온다 
	public int insertStarGrade(int stargrade, String movievo, int memberno) {
		Connection conn= getConnection(); 
		 int stargraded= new MovieDao().insertStarGrade(conn,stargrade,movievo,memberno);
               if(stargraded>0) {
            	  commit(conn);
               }else {
            	   rollback(conn);
               }
		 
		 close(conn);
		
		
		return stargraded;
	}

}     
