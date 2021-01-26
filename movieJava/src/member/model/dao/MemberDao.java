package member.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import member.model.vo.Member;

public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	// 로그인용
	public Member loginMember(Connection conn, Member m) {
		Member loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemId());
			pstmt.setString(2, m.getMemPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member(rset.getInt("mem_no"),
						               rset.getString("mem_id"),
						               rset.getString("mem_pwd"),
						               rset.getString("mem_name"),
						               rset.getString("mem_birth"),
						               rset.getString("email"),
						               rset.getString("phone"),
						               rset.getString("address"),
						               rset.getInt("point"),
						               rset.getString("grade"),
						               rset.getDate("ent_date"),
						               rset.getDate("modify_date"),
						               rset.getString("mem_status")); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return loginUser;
	}

	// 회원가입용
	public int joinMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("joinMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemId());
			pstmt.setString(2, m.getMemPwd());
			pstmt.setString(3, m.getMemName());
			pstmt.setString(4, m.getMemBirth());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getPhone());
			pstmt.setString(7, m.getAddress());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 아이디 중복 체크
	public int idCheck(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	// 아이디 검색
	public Member idSearch(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member mem = null;
		String sql = prop.getProperty("idSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemName());
			pstmt.setString(2, m.getMemBirth());
			pstmt.setString(3, m.getEmail());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mem = new Member(rset.getInt("MEM_NO"),
						         rset.getString("MEM_ID"),
						         rset.getString("MEM_PWD"),
						         rset.getString("MEM_NAME"),
						         rset.getString("MEM_BIRTH"),
						         rset.getString("EMAIL"),
						         rset.getString("PHONE"),
						         rset.getString("ADDRESS"),
						         rset.getInt("POINT"),
						         rset.getString("GRADE"),
						         rset.getDate("ENT_DATE"),
						         rset.getDate("MODIFY_DATE"),
						         rset.getString("MEM_STATUS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return mem;
	}

	// 비밀번호 찾기
	public Member pwdSearch(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member mem = null;
		String sql = prop.getProperty("pwdSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemName());
			pstmt.setString(2, m.getMemId());
			pstmt.setString(3, m.getEmail());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mem = new Member(rset.getInt("MEM_NO"),
						         rset.getString("MEM_ID"),
						         rset.getString("MEM_PWD"),
						         rset.getString("MEM_NAME"),
						         rset.getString("MEM_BIRTH"),
						         rset.getString("EMAIL"),
						         rset.getString("PHONE"),
						         rset.getString("ADDRESS"),
						         rset.getInt("POINT"),
						         rset.getString("GRADE"),
						         rset.getDate("ENT_DATE"),
						         rset.getDate("MODIFY_DATE"),
						         rset.getString("MEM_STATUS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return mem;
	}

	// 회원번호로 회원 조회
	public Member searchMember(Connection conn, int memNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member mem = null;
		String sql = prop.getProperty("searchMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mem = new Member(rset.getInt("MEM_NO"),
						         rset.getString("MEM_ID"),
						         rset.getString("MEM_PWD"),
						         rset.getString("MEM_NAME"),
						         rset.getString("MEM_BIRTH"),
						         rset.getString("EMAIL"),
						         rset.getString("PHONE"),
						         rset.getString("ADDRESS"),
						         rset.getInt("POINT"),
						         rset.getString("GRADE"),
						         rset.getDate("ENT_DATE"),
						         rset.getDate("MODIFY_DATE"),
						         rset.getString("MEM_STATUS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return mem;
	}

	// 임시 비밀번호 업데이트
	public int updateTempPwd(Connection conn, int memNo, String tempPwd) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateTempPwd");
		
		try {
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setString(1, tempPwd);
			pstmt.setInt(2, memNo);
			
			result = pstmt.executeUpdate();
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
	// 5. 비밀번호 변경용 dao
		public int updatePwd(Connection conn, String memId, String memPwd, String newPwd) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("updatePwd");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, newPwd);
				pstmt.setString(2, memId);
				pstmt.setString(3, memPwd);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
		
		
		
		// 4. userId로 회원 한명 조회용 dao
		public Member selectMember(Connection conn, String memId) {
			Member mem = null;
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectMember");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memId);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					mem = new Member(rset.getInt("MEM_NO"),
					         rset.getString("MEM_ID"),
					         rset.getString("MEM_PWD"),
					         rset.getString("MEM_NAME"),
					         rset.getString("MEM_BIRTH"),
					         rset.getString("EMAIL"),
					         rset.getString("PHONE"),
					         rset.getString("ADDRESS"),
					         rset.getInt("POINT"),
					         rset.getString("GRADE"),
					         rset.getDate("ENT_DATE"),
					         rset.getDate("MODIFY_DATE"),
					         rset.getString("MEM_STATUS"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return mem;
		}

}
