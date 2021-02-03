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

import board.model.vo.Board;
import manager.model.vo.PageInfo;
import manager.model.vo.Search;
import member.model.dao.MemberDao;
import member.model.vo.Member;
import movie.MovieVO;
import movieTag.model.vo.MovieTag;
import qaAnswer.model.vo.QAAnswer;
import store.model.vo.Store;
import tag.model.vo.Tag;

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

	// 회원 포인트 변경
	public int memberChangePoint(Connection conn, int memNo, int point) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("memberChangePoint");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, point);
			pstmt.setInt(2, memNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 회원 상태 변경
	public int memberStatusChange(Connection conn, int memNo, String status) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("memberStatusChange");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, status);
			pstmt.setInt(2, memNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
// -----------------------------------  Store  --------------------------------------------------	

	// 상품 갯수 조회
	public int countStore(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		String sql = prop.getProperty("countStore");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return result;
	}

	// 페이징 상품 목록
	public ArrayList<Store> selectStore(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Store> list = new ArrayList<>();
		String sql = prop.getProperty("selectStore");
		
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

	// 검색 상품 갯수
	public int countSearchStore(Connection conn, Search s) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int storeCount = 0;
		String sql = prop.getProperty("countSearchStore");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, s.getSearch());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				storeCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return storeCount;
	}

	// 상품 검색 리스트
	public ArrayList<Store> selectSearchStore(Connection conn, PageInfo pi, Search s) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Store> storeList = new ArrayList<>();
		String sql = prop.getProperty("selectSearchStore");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, s.getSearch());
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				storeList.add(new Store(rset.getInt(2),
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
		
		return storeList;
	}

	// 상품 등록
	public int insertStore(Connection conn, Store st) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertStore");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, st.getStoreContent());
			pstmt.setString(2, st.getStoreTitle());
			pstmt.setString(3, st.getStorePrice());
			pstmt.setInt(4, st.getStoreQuantity());
			pstmt.setString(5, st.getStorePath());
			pstmt.setString(6, st.getOriginName());
			pstmt.setString(7, st.getRename());
			pstmt.setInt(8, st.getStCategory());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
// -----------------------------------  Tag  --------------------------------------------------

	// 태그 총 갯수
	public int tagCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int tagCount = 0;
		String sql = prop.getProperty("tagCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				tagCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return tagCount;
	}

	// 태그 리스트
	public ArrayList<Tag> selectTagList(Connection conn) {
		ArrayList<Tag> list = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTagList");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new Tag(rset.getInt(1),
								 rset.getString(2),
								 rset.getDate(3),
								 rset.getString(4)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	// 태그 삭제
	public int removeTag(Connection conn, String tagId) {
		String[] tagIdArr = tagId.split(",");
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("removeTag");
		
		try {
			for(int i = 0; i < tagIdArr.length; i++) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, Integer.parseInt(tagIdArr[i]));
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 태그 추가
	public int addTag(Connection conn, String tagName) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("addTag");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "#" + tagName);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
// -----------------------------------  Board  --------------------------------------------------	

	// 게시글 총 갯수
	public int boardCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int boardCount = 0;
		String sql = prop.getProperty("boardCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				boardCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return boardCount;
	}

	public int netflixCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int netflixCount = 0;
		String sql = prop.getProperty("netflixCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				netflixCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return netflixCount;
	}

	public int watchaCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int watchaCount = 0;
		String sql = prop.getProperty("watchaCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				watchaCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return watchaCount;
	}

	// 넷플릭스 게시판 검색 결과 갯수
	public int countSearchNetflix(Connection conn, Search s) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String sql = prop.getProperty("countSearchNetflix");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, s.getSearch());
			
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

	// 넷플릭스 게시판 검색 결과 리스트
	public ArrayList<Board> selectSearchNetflix(Connection conn, PageInfo pi, Search s) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSearchNetflix");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, s.getSearch());
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt(2),
						           rset.getInt(3),
						           rset.getString(4),
						           rset.getString(5),
						           rset.getString(6),
						           rset.getInt(7),
						           rset.getDate(8),
						           rset.getDate(9),
						           rset.getString(10)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	// 게시글 상세 보기용
	public Board selectBoard(Connection conn, int brdNo) {
		PreparedStatement pstmt = null;
		Board b = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, brdNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt(1),
				           rset.getInt(2),
				           rset.getString(3),
				           rset.getString(4),
				           rset.getString(5),
				           rset.getInt(6),
				           rset.getDate(7),
				           rset.getDate(8),
				           rset.getString(9),
				           rset.getString(10));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}

	// 게시글 삭제
	public int removeBoard(Connection conn, int brdNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("removeBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, brdNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 게시글 페이징 된 리스트
	public ArrayList<Board> selectNetflixList(Connection conn, PageInfo pi) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNetflixList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt(2),
						           rset.getInt(3),
						           rset.getString(4),
						           rset.getString(5),
						           rset.getString(6),
						           rset.getInt(7),
						           rset.getDate(8),
						           rset.getDate(9),
						           rset.getString(10)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	// 게시글 페이징 된 리스트(왓챠)
	public ArrayList<Board> selectWatchaList(Connection conn, PageInfo pi) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectWatchaList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt(2),
						           rset.getInt(3),
						           rset.getString(4),
						           rset.getString(5),
						           rset.getString(6),
						           rset.getInt(7),
						           rset.getDate(8),
						           rset.getDate(9),
						           rset.getString(10)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	// 검색 게시글 갯수(왓챠)
	public int countSearchWatcha(Connection conn, Search s) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String sql = prop.getProperty("countSearchWatcha");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, s.getSearch());
			
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

	// 검색 게시글 리스트(왓챠)
	public ArrayList<Board> selectSearchWatcha(Connection conn, PageInfo pi, Search s) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSearchWatcha");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, s.getSearch());
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt(2),
						           rset.getInt(3),
						           rset.getString(4),
						           rset.getString(5),
						           rset.getString(6),
						           rset.getInt(7),
						           rset.getDate(8),
						           rset.getDate(9),
						           rset.getString(10)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	// 문의글 갯수 세기
	public int qaCount(Connection conn) {
		Statement stmt = null;
		int qaCount = 0;
		ResultSet rset = null;
		String sql = prop.getProperty("qaCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				qaCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return qaCount;
	}

	public int qaWaitCount(Connection conn) {
		Statement stmt = null;
		int qaWaitCount = 0;
		ResultSet rset = null;
		String sql = prop.getProperty("qaWaitCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				qaWaitCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return qaWaitCount;
	}

	public int qaCompleteCount(Connection conn) {
		Statement stmt = null;
		int qaCompleteCount = 0;
		ResultSet rset = null;
		String sql = prop.getProperty("qaCompleteCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				qaCompleteCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return qaCompleteCount;
	}

	public ArrayList<Board> selectQAList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<>();
		String sql = prop.getProperty("selectQaList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt(2),
						           rset.getInt(3),
						           rset.getString(4),
						           rset.getString(5),
						           rset.getString(6),
						           rset.getInt(7),
						           rset.getDate(8),
						           rset.getDate(9),
						           rset.getString(10),
						           rset.getString(11)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	// 문의 답변 달기
	public int insertAnswer(Connection conn, QAAnswer qa) {
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rset = null;
		String sql = prop.getProperty("insertAnswer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, qa.getAnsContent());
			pstmt.setInt(2, qa.getBrdNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 문의 답변 가져오기
	public QAAnswer selectQA(Connection conn, int brdNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		QAAnswer qa = null;
		String sql = prop.getProperty("selectQA");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, brdNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				qa = new QAAnswer(rset.getInt(1),
						          rset.getString(2),
						          rset.getDate(3),
						          rset.getDate(4),
						          rset.getString(5),
						          rset.getInt(6));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return qa;
	}

	// 답변 대기 -> 답변 완료 변경
	public int changeWait(Connection conn, int brdNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("changeWait");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, brdNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 답변 대기 문의글 리스트
	public ArrayList<Board> selectQAWaitList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<>();
		String sql = prop.getProperty("selectQAWaitList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt(2),
						           rset.getInt(3),
						           rset.getString(4),
						           rset.getString(5),
						           rset.getString(6),
						           rset.getInt(7),
						           rset.getDate(8),
						           rset.getDate(9),
						           rset.getString(10),
						           rset.getString(11)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

// -----------------------------------  Movie  --------------------------------------------------
	
	// 등록된 영화 갯수
	public int countMovie(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countMovie");
		int countMovie = 0;
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				countMovie = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return countMovie;
	}

	// 영화 전체 목록 리스트
	public ArrayList<MovieVO> selectListMovie(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListMovie");
		ArrayList<MovieVO> list = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new MovieVO(rset.getString(2),
									 rset.getString(3),
									 rset.getString(4),
									 rset.getString(5),
									 rset.getString(6),
									 rset.getString(7),
									 rset.getString(8),
									 rset.getString(9),
									 rset.getString(10),
									 rset.getInt(11),
									 rset.getString(12)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	// 영화 검색 목록 갯수
	public int countSearchMovie(Connection conn, Search s) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countSearchMovie");
		int movieCount = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, s.getSearch());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				movieCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return movieCount;
	}

	// 영화 검색 목록 리스트
	public ArrayList<MovieVO> selectSearchMovie(Connection conn, PageInfo pi, Search s) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MovieVO> list = new ArrayList<MovieVO>();
		String sql = prop.getProperty("selectSearchMovie");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, s.getSearch());
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new MovieVO(rset.getString(2),
									 rset.getString(3),
									 rset.getString(4),
									 rset.getString(5),
									 rset.getString(6),
									 rset.getString(7),
									 rset.getString(8),
									 rset.getString(9),
									 rset.getString(10),
									 rset.getInt(11),
									 rset.getString(12)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	// 태그가 달리지 않은 영화 목록 갯수
	public int countNotMovieTag(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int countNotMovieTag = 0;
		String sql = prop.getProperty("countNotMovieTag");
		
		try {
			stmt = conn.createStatement();
			
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				countNotMovieTag = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return countNotMovieTag;
	}

	// 태그가 달리지 않은 영화 목록 리스트
	public ArrayList<MovieTag> selectMovieTagList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MovieTag> list = new ArrayList<>();
		String sql = prop.getProperty("selectMovieTagList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new MovieTag(rset.getString(2),
									  rset.getString(3),
									  rset.getString(4),
									  rset.getString(5),
									  rset.getString(6),
									  rset.getString(7),
									  rset.getString(8),
									  rset.getString(9),
									  rset.getString(10),
									  rset.getString(11),
									  rset.getInt(12),
									  rset.getString(13)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	// 영화에 태그를 달기 위한 영화 정보
	public MovieVO selectMovie(Connection conn, String m_code) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MovieVO movie = null;
		String sql = prop.getProperty("selectMovie");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m_code);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				movie = new MovieVO(rset.getString(1),
									rset.getString(2),
									rset.getString(3),
									rset.getString(4),
									rset.getString(5),
									rset.getString(6),
									rset.getString(7),
									rset.getString(8),
									rset.getString(9),
									rset.getInt(10),
									rset.getString(11));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return movie;
	}

	// 영화에 태그 달기
	public int addMovieTag(Connection conn, String tagId, String movieCode) {
		String[] addTagIdArr = tagId.split(",");
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("addMovieTag");
		
		try {
			for(int i = 0; i < addTagIdArr.length; i++) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, Integer.parseInt(addTagIdArr[i]));
				pstmt.setString(2, movieCode);
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
