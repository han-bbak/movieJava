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
	
}
