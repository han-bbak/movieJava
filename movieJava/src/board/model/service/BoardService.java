package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.Board;
import board.model.vo.PageInfo;
import board.model.vo.Reply;
import board.model.vo.Search;

public class BoardService {
	
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Board> selectList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}

	public int getSearchListCount(Search s) {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getSearchListCount(conn, s);
		
		close(conn);
		
		return listCount;

	}

	public ArrayList<Board> selectSearchList(PageInfo pi, Search s) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectSearchList(conn, pi, s);
		
		close(conn);
		
		return list;
	}

	public Board selectBoard(int brd_no) {
		Connection conn = getConnection();
		
		BoardDao bd = new BoardDao();
		
		int result = bd.increaseCount(conn, brd_no);
		
		Board b = null;
		
		if(result > 0) {
			commit(conn);
			b = bd.selectBoard(conn, brd_no);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return b;
	}

	public Board selectBoardNocnt(int brd_no) {
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectBoard(conn, brd_no);
		
		close(conn);
		
		return b;
	}

	public int updateBoard(Board b) {
		Connection conn = getConnection();
		
		int result = new BoardDao().updateBoard(conn, b);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int deleteBoard(int brd_no) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteBoard(conn, brd_no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int insertBoard(Board b) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertBoard(conn, b);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
				
		return result;
	}

	public ArrayList<Reply> selectReplyList(int brd_no) {
		Connection conn = getConnection();
		ArrayList<Reply> rList = new BoardDao().selectReplyList(conn, brd_no);
		
		close(conn);
		
		return rList;
	}

	public ArrayList<Reply> insertReply(Reply r) {
		Connection conn = getConnection();
		BoardDao bd = new BoardDao();
		
		int result = bd.insertReply(conn, r);
		
		ArrayList<Reply> rList = null;
		
		if(result > 0) {
			commit(conn);
			rList = bd.selectReplyList(conn, r.getBrd_no());
		} else {
			rollback(conn);
		}
		
		close(conn);

		return rList;
	}

	public int deleteReply(int rp_no) {
		Connection conn = getConnection();
		int result = new BoardDao().deleteReply(conn, rp_no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int getListCount1() {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getListCount1(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Board> selectList1(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList1(conn, pi);
		
		close(conn);
		
		return list;
	}

	public int getSearchListCount1(Search s) {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getSearchListCount1(conn, s);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Board> selectSearchList1(PageInfo pi, Search s) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectSearchList1(conn, pi, s);
		
		close(conn);
		
		return list;
	}

	public int insertBoard1(Board b) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertBoard1(conn, b);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
				
		return result;
	}
	
	public int getListCount2() {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getListCount2(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Board> selectList2(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList2(conn, pi);
		
		close(conn);
		
		return list;
	}

	public int getSearchListCount2(Search s) {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getSearchListCount2(conn, s);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Board> selectSearchList2(PageInfo pi, Search s) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectSearchList2(conn, pi, s);
		
		close(conn);
		
		return list;
	}

	public int insertBoard2(Board b) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertBoard2(conn, b);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
				
		return result;
	}

	public int updateReply(Reply r) {
		Connection conn = getConnection();
		int result = new BoardDao().updateReply(conn, r);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

}
