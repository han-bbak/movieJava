package manager.model.dao;

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

import manager.model.vo.PageInfo;
import manager.model.vo.Search;
import member.model.dao.MemberDao;
import member.model.vo.Member;

public class ManagerDao {
	private Properties prop = new Properties();
	
	public ManagerDao() {
		String fileName = MemberDao.class.getResource("/sql/manager/manager-query.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 회원 수 조회
	public int countMember(Connection conn) {
		int countMember = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countMember");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				countMember = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return countMember;
	}

	// 페이징 처리 된 memberList 조회
	public ArrayList<Member> selectList(Connection conn, PageInfo pi) {
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getInt(2),
						            rset.getString(3),
						            rset.getString(4),
						            rset.getString(5),
						            rset.getString(6),
						            rset.getString(7),
						            rset.getString(8),
						            rset.getString(9),
						            rset.getInt(10),
						            rset.getString(11),
						            rset.getDate(12),
						            rset.getDate(13),
						            rset.getString(14)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	// 회원 검색 카운트
	public int countSearchMember(Connection conn, Search s) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String sql = "";
		
		if(s.getSearchCondition().equals("name")) {
			sql = prop.getProperty("searchNameMember");
		} else if(s.getSearchCondition().equals("userId")) {
			sql = prop.getProperty("searchIdMember");
		} else {
			sql = prop.getProperty("searchPhoneMember");
		}
		
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

	// 회원 검색용
	public ArrayList<Member> selectSearchList(Connection conn, PageInfo pi, Search s) {
		PreparedStatement pstmt = null;
		ArrayList<Member> list = new ArrayList<>();
		ResultSet rset = null;
		String sql = "";
		
		if(s.getSearchCondition().equals("name")) {
			sql = prop.getProperty("selectSearchNameMember");
		} else if(s.getSearchCondition().equals("userId")) {
			sql = prop.getProperty("selectSearchIdMember");
		} else {
			sql = prop.getProperty("selectSearchPhoneMember");
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, s.getSearch());
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();

			while(rset.next()) {
				list.add(new Member(rset.getInt(2),
						            rset.getString(3),
						            rset.getString(4),
						            rset.getString(5),
						            rset.getString(6),
						            rset.getString(7),
						            rset.getString(8),
						            rset.getString(9),
						            rset.getInt(10),
						            rset.getString(11),
						            rset.getDate(12),
						            rset.getDate(13),
						            rset.getString(14)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 회원 상세 정보
	public Member selectMember(Connection conn, int memNo) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt(1),
					           rset.getString(2),
					           rset.getString(3),
					           rset.getString(4),
					           rset.getString(5),
					           rset.getString(6),
					           rset.getString(7),
					           rset.getString(8),
					           rset.getInt(9),
					           rset.getString(10),
					           rset.getDate(11),
					           rset.getDate(12),
					           rset.getString(13));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

}