package manager.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.vo.Board;
import manager.model.dao.ManagerDao;
import manager.model.vo.PageInfo;
import manager.model.vo.Search;
import member.model.vo.Member;
import store.model.vo.Store;
import tag.model.vo.Tag;

public class ManagerService {

	// 회원 수 조회
	public int countMember() {
		Connection conn = getConnection();
		
		int countMember = new ManagerDao().countMember(conn);
		
		close(conn);
		
		return countMember;
	}

	// 페이징 처리 된 회원 리스트
	public ArrayList<Member> selectList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new ManagerDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}

	// 검색용 회원 리스트
	public int countSearchMember(Search s) {
		Connection conn = getConnection();
		
		int listCount = new ManagerDao().countSearchMember(conn, s);
		
		close(conn);
		
		return listCount;
	}

	// 회원 검색용 리스트
	public ArrayList<Member> selectSearchList(PageInfo pi, Search s) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new ManagerDao().selectSearchList(conn, pi, s);
		
		close(conn);
		
		return list;
	}

	// 회원 상세 정보
	public Member selectMember(int memNo) {
		Connection conn = getConnection();
		
		Member m = new ManagerDao().selectMember(conn, memNo);
		
		close(conn);
		
		return m;
	}

	// 회원 포인트 변경
	public int memberChangePoint(int memNo, int point) {
		Connection conn = getConnection();
		int changePoint = 0;
		
		int result = new ManagerDao().memberChangePoint(conn, memNo, point);
		
		if(result > 0) {
			commit(conn);
			Member m = new ManagerDao().selectMember(conn, memNo);
			if(m != null) {
				changePoint = m.getPoint();
			}
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return changePoint;
	}

	// 회원 status 변경
	public Member memberStatusChange(int memNo, String status) {
		Connection conn = getConnection();
		Member m = null;
		
		int result = new ManagerDao().memberStatusChange(conn, memNo, status);
		
		if(result > 0) {
			commit(conn);
			m = new ManagerDao().selectMember(conn, memNo);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return m;
	}

// -----------------------------------  Store  --------------------------------------------------	
	
	// 상품 리스트 갯수
	public int countStore() {
		Connection conn = getConnection();
		
		int countStore = new ManagerDao().countStore(conn);
		
		close(conn);
		
		return countStore;
	}

	// 상품 리스트 조회(페이징)
	public ArrayList<Store> selectStore(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Store> list = new ManagerDao().selectStore(conn, pi);
		
		close(conn);
		
		return list;
	}

	// 상품 검색 갯수 조회
	public int countSearchStore(Search s) {
		Connection conn = getConnection();
		
		int storeCount = new ManagerDao().countSearchStore(conn, s);
		
		close(conn);
		
		return storeCount;
	}

	// 검색 상품 리스트
	public ArrayList<Store> selectSearchStore(PageInfo pi, Search s) {
		Connection conn = getConnection();
		
		ArrayList<Store> storeList = new ManagerDao().selectSearchStore(conn, pi, s);
		
		close(conn);
		
		return storeList;
	}

	// 상품 등록
	public int insertStore(Store st) {
		Connection conn = getConnection();
		
		int result = new ManagerDao().insertStore(conn, st);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

// -----------------------------------  Tag  --------------------------------------------------

	// 태그 총 갯수
	public int tagCount() {
		Connection conn = getConnection();
		
		int tagCount = new ManagerDao().tagCount(conn);
		
		close(conn);
		
		return tagCount;
	}

	// 태그 리스트
	public ArrayList<Tag> selectTagList() {
		Connection conn = getConnection();
		
		ArrayList<Tag> list = new ManagerDao().selectTagList(conn);
		
		close(conn);
		
		return list;
	}

	// 태그 삭제
	public int removeTag(String tagName) {
		Connection conn = getConnection();
		
		int result = new ManagerDao().removeTag(conn, tagName);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 태그 추가
	public int addTag(String tagName) {
		Connection conn = getConnection();
		
		int result = new ManagerDao().addTag(conn, tagName);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

// -----------------------------------  Board  --------------------------------------------------	
	
	// 게시글 총 갯수
	public int boardCount() {
		Connection conn = getConnection();
		
		int boardCount = new ManagerDao().boardCount(conn);
		
		close(conn);
		
		return boardCount;
	}

	public int netflixCount() {
		Connection conn = getConnection();
		
		int netflixCount = new ManagerDao().netflixCount(conn);
		
		close(conn);
		
		return netflixCount;
	}

	public int watchaCount() {
		Connection conn = getConnection();
		
		int watchaCount = new ManagerDao().watchaCount(conn);
		
		close(conn);
		
		return watchaCount;
	}

	// 넷플릭스 게시판 검색 결과 갯수
	public int countSearchNetflix(Search s) {
		Connection conn = getConnection();
		
		int searchNetflix = new ManagerDao().countSearchNetflix(conn, s);
		
		close(conn);
		
		return searchNetflix;
	}

	// 넷플릭스 게시판 검색 결과 리스트
	public ArrayList<Board> selectSearchNetflix(board.model.vo.PageInfo pi, Search s) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new ManagerDao().selectSearchNetflix(conn, pi, s);
		
		close(conn);
		
		return list;
	}

}
