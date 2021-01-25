package member.model.Service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import member.model.dao.MemberDao;
import member.model.vo.Member;
public class MemberService {

	// 로그인용
	public Member loginMember(Member m) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao().loginMember(conn, m);
		
		close(conn);
		
		return loginUser;
	}

	// 회원가입용
	public int joinMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().joinMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 중복 아이디 체크
	public int idCheck(String userId) {
		Connection conn = getConnection();
		
		int result = new MemberDao().idCheck(conn, userId);
		
		close(conn);
		
		return result;
	}

	// 아이디 검색용
	public Member idSearch(Member m) {
		Connection conn = getConnection();
		Member mem = new MemberDao().idSearch(conn, m);
		
		close(conn);
		
		return mem;
	}

	// 비밀번호 찾기
	public Member pwdSearch(Member m) {
		Connection conn = getConnection();
		Member mem = new MemberDao().pwdSearch(conn, m);
		
		close(conn);
		return mem;
	}

	// 회원 번호로 회원 조회
	public Member searchMember(int memNo) {
		Connection conn = getConnection();
		Member mem = new MemberDao().searchMember(conn, memNo);
		
		close(conn);
		return mem;
	}
	
	// 임시비밀번호 업데이트
	public int updateTempPwd(int memNo, String tempPwd) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateTempPwd(conn, memNo, tempPwd);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
}
