package manager.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import manager.model.dao.ManagerDao;
import manager.model.vo.PageInfo;
import manager.model.vo.Search;
import member.model.vo.Member;

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

}
