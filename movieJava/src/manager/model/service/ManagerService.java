package manager.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import manager.model.dao.ManagerDao;
import manager.model.vo.PageInfo;
import manager.model.vo.Search;
import member.model.vo.Member;
import store.model.vo.Store;

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
		
		return result;
	}

}
