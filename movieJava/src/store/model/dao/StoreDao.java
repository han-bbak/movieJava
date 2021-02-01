package store.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import store.model.vo.PageInfo;
import store.model.vo.Search;
import store.model.vo.Store;


public class StoreDao {
	private Properties prop = new Properties();
	
	public StoreDao() {
		String fileName = StoreDao.class.getResource("/sql/store/store-query.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getListCount");

		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
		
		
	}

	public ArrayList<Store> selectList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Store> list = new ArrayList<>();
		String sql = prop.getProperty("selectList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Store(rset.getInt(2),
						           rset.getString(3),
						           rset.getString(4),
						           rset.getString(5),
						           rset.getInt(6),
						           rset.getString(7),
						           rset.getString(8),
						           rset.getString(9),
						           rset.getInt(10)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int getSearchListCount(Connection conn, Search s) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getSearchTitleListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, s.getSearch());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<Store> selectSearchList(Connection conn, PageInfo pi, Search s) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Store> list = new ArrayList<>();
		String sql = prop.getProperty("selectSearchList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, s.getSearch());
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Store(rset.getInt(2),
				           rset.getString(3),
				           rset.getString(4),
				           rset.getString(5),
				           rset.getInt(6),
				           rset.getString(7),
				           rset.getString(8),
				           rset.getString(9),
				           rset.getInt(10)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
