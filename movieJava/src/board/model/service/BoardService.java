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



}
