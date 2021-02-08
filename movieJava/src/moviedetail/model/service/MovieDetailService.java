package moviedetail.model.service;

import java.sql.Connection;


import interest.model.vo.Interest;

import static common.JDBCTemplate.*;
import movie.model.vo.MovieVO;
import moviedetail.model.dao.InterestDao;
import moviedetail.model.dao.MovieDetailDao;

public class MovieDetailService {

	public MovieVO selectMovie(String mCode) {
		Connection conn = getConnection();
		
		MovieVO movie = new MovieDetailDao().selectMovie(conn, mCode);
		
		close(conn);
		
		return movie;
	}
      //  Stargrade에 불러올 테이블들을 (int stargrade, String movievo, int memberno)가져온다 
	public int insertStarGrade(int stargrade, String movievo, int memberno) {
		Connection conn= getConnection(); 
		 int stargraded= new MovieDetailDao().insertStarGrade(conn,stargrade,movievo,memberno);
		 int updateGrade = new MovieDetailDao().updateMovieGrade(conn, movievo);
               if(stargraded>0 && updateGrade > 0) {
            	  commit(conn);
               }else {
            	   rollback(conn);
               }
		 
		 close(conn);
		
		
		return stargraded;
	}
	public int insertInterest(  int mem_no ,String m_code ) {
		Connection conn= getConnection(); 
		 int interest = new InterestDao().insertInterest(conn,mem_no,m_code);
               if(interest > 0) {
            	  commit(conn);
               }else {
            	   rollback(conn);
               }
		 
		 close(conn);
		
		
		return interest;
	
 }
}



 
