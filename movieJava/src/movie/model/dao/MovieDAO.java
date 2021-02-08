package movie.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import common.JDBCTemplate;
import manager.model.vo.PageInfo;
import member.model.dao.MemberDao;
import member.model.vo.Member;
import movie.model.vo.MovieVO;
import movie.model.vo.Search;
import point.model.vo.Point;

public class MovieDAO {

	private Properties prop = new Properties();

	public MovieDAO() {

		String fileName = MovieDAO.class.getResource("/sql/main/movie-query.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 전체 영화 검색
	public ArrayList<MovieVO> getAllMovie(Connection conn) {

		ArrayList<MovieVO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select * from movie";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MovieVO Movie = new MovieVO();
				Movie.setM_code(rs.getString("m_code"));
				Movie.setM_title(rs.getString("m_title"));
				Movie.setM_genre(rs.getString("m_genre"));
				Movie.setM_director(rs.getString("m_director"));
				Movie.setM_date(rs.getString("m_date"));
				Movie.setM_country(rs.getString("m_country"));
				Movie.setM_image(rs.getString("m_image"));
				Movie.setM_summary(rs.getString("m_summary"));
				Movie.setM_rating(rs.getString("m_rating"));
				Movie.setM_grade(rs.getInt("m_grade"));
				Movie.setStatus(rs.getString("status"));
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;

	}

			/* 키워드 검색
			 * 
			 * 직접 검색/장르필터/정렬 3가지 경우의 수 가져오기
			 */
	public ArrayList<MovieVO> selectSearchMovie(Connection conn, Search filter) {
		ArrayList<MovieVO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		System.out.println(filter);
		try {
			if (filter.getSort() != null && !filter.getSort().equals("all")) {
				if (filter.getSort().equals("최신")) {
					sql = prop.getProperty("MovieSearchSort1");
				} else {
					if (filter.getSort().equals("평점")) {
						sql = prop.getProperty("MovieSearchSort2");
					}
				}
			} else {
				sql = prop.getProperty("MovieSearch");
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, filter.getSearch());
			if (filter.getGenre() != null && !filter.getGenre().equals("all")) {
				pstmt.setString(2, filter.getGenre());
			} else {
				pstmt.setString(2, "");
			}

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MovieVO movie = new MovieVO();
				movie.setM_code(rs.getString("m_code"));
				movie.setM_title(rs.getString("m_title"));
				movie.setM_genre(rs.getString("m_genre"));
				movie.setM_director(rs.getString("m_director"));
				movie.setM_date(rs.getString("m_date"));
				movie.setM_country(rs.getString("m_country"));
				movie.setM_image(rs.getString("m_image"));
				movie.setM_summary(rs.getString("m_summary"));
				movie.setM_rating(rs.getString("m_rating"));
				movie.setM_grade(rs.getDouble("m_grade"));
				movie.setStatus(rs.getString("status"));
				list.add(movie);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}


	
		public MovieVO selectMovie(Connection conn, String memId) {
		MovieVO movie = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("movieselect");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				movie = new MovieVO(rset.getString("M_CODE"), rset.getString("M_TITLE"), rset.getString("M_GENRE"),
						rset.getString("M_DIRECTOR"), rset.getString("M_DATE"), rset.getString("M_COUNTRY"),
						rset.getString("M_IMAGE"), rset.getString("M_SUMMARY"), rset.getString("M_RATING"),
						rset.getInt("M_GRADE"), rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return movie;

	}

		public ArrayList<MovieVO> selectMovieList(Connection conn, String memId) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<MovieVO> mList = new ArrayList<MovieVO>();
			String sql = prop.getProperty("selectMovieList");
			
			try {

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memId);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					mList.add(new MovieVO(rset.getString("M_CODE"), rset.getString("M_TITLE"), rset.getString("M_GENRE"),
							rset.getString("M_DIRECTOR"), rset.getString("M_DATE"), rset.getString("M_COUNTRY"),
							rset.getString("M_IMAGE"), rset.getString("M_SUMMARY"), rset.getString("M_RATING"),
							rset.getInt("M_GRADE"), rset.getString("STATUS")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return mList;
		}
		}


