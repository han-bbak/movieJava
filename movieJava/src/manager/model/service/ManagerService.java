package manager.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.vo.Board;
import manager.model.dao.ManagerDao;
import manager.model.vo.PageInfo;
import manager.model.vo.Search;
import member.model.vo.Member;
import movie.MovieVO;
import movieTag.model.vo.MovieTag;
import qaAnswer.model.vo.QAAnswer;
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
	public int removeTag(String tagId) {
		Connection conn = getConnection();
		
		int result = new ManagerDao().removeTag(conn, tagId);
		
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
	public ArrayList<Board> selectSearchNetflix(PageInfo pi, Search s) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new ManagerDao().selectSearchNetflix(conn, pi, s);
		
		close(conn);
		
		return list;
	}

	// 게시글 상세보기용
	public Board selectBoard(int brdNo) {
		Connection conn = getConnection();
		
		Board b = new ManagerDao().selectBoard(conn, brdNo);
		
		close(conn);
		
		return b;
	}

	// 게시글 삭제
	public int removeBoard(int brdNo) {
		Connection conn = getConnection();
		
		int result = new ManagerDao().removeBoard(conn, brdNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 게시글 페이징 된 리스트(넷플릭스)
	public ArrayList<Board> selectNetflixList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new ManagerDao().selectNetflixList(conn, pi);
		
		close(conn);
		
		return list;
	}

	// 게시글 페이징 된 리스트(왓챠)
	public ArrayList<Board> selectWatchaList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new ManagerDao().selectWatchaList(conn, pi);
		
		close(conn);
		
		return list;
	}

	// 검색 게시글 갯수 (왓챠)
	public int countSearchWatcha(Search s) {
		Connection conn = getConnection();
		
		int searchWatcha = new ManagerDao().countSearchWatcha(conn, s);
		
		close(conn);
		
		return searchWatcha;
	}

	// 검색 게시글 리스트(왓챠)
	public ArrayList<Board> selectSearchWatcha(PageInfo pi, Search s) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new ManagerDao().selectSearchWatcha(conn, pi, s);
		
		close(conn);
		
		return list;
	}

	// 문의글 갯수 세기
	public int qaCount() {
		Connection conn = getConnection();
		
		int qaCount = new ManagerDao().qaCount(conn);
		
		close(conn);
		
		return qaCount;
	}

	public int qaWaitCount() {
		Connection conn = getConnection();
		
		int qaWaitCount = new ManagerDao().qaWaitCount(conn);
		
		close(conn);
		
		return qaWaitCount;
	}

	public int qaCompleteCount() {
		Connection conn = getConnection();
		
		int qaCompleteCount = new ManagerDao().qaCompleteCount(conn);
		
		close(conn);
		
		return qaCompleteCount;
	}

	// 문의글 전체 목록(페이징)
	public ArrayList<Board> selectQAList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new ManagerDao().selectQAList(conn, pi);
		
		close(conn);
		
		return list;
	}

	// 문의 답변 달기
	public int insertAnswer(QAAnswer qa) {
		Connection conn = getConnection();
		
		int result = new ManagerDao().insertAnswer(conn, qa);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 문의 답변내용 가져오기
	public QAAnswer selectQA(int brdNo) {
		Connection conn = getConnection();
		
		QAAnswer qa = new ManagerDao().selectQA(conn, brdNo);
		
		close(conn);
		
		return qa;
	}

	// 답변 대기 -> 답변 완료 변경
	public int changeWait(int brdNo) {
		Connection conn = getConnection();
		
		int result = new ManagerDao().changeWait(conn, brdNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 답변 대기 문의글 리스트
	public ArrayList<Board> selectQAWaitList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new ManagerDao().selectQAWaitList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
// -----------------------------------  Movie  --------------------------------------------------

	// 영화 등록된 갯수
	public int countMovie() {
		Connection conn = getConnection();
		
		int countMovie = new ManagerDao().countMovie(conn);
		
		close(conn);
		
		return countMovie;
	}

	// 영화 전체 목록 리스트
	public ArrayList<MovieVO> selectListMovie(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<MovieVO> list = new ManagerDao().selectListMovie(conn, pi);
		
		close(conn);
		
		return list;
	}

	// 영화 검색 목록 갯수
	public int countSearchMovie(Search s) {
		Connection conn = getConnection();
		
		int movieCount = new ManagerDao().countSearchMovie(conn, s);
		
		close(conn);
		
		return movieCount;
	}

	// 영화 검색 목록 리스트
	public ArrayList<MovieVO> selectSearchMovie(PageInfo pi, Search s) {
		Connection conn = getConnection();
		
		ArrayList<MovieVO> list = new ManagerDao().selectSearchMovie(conn, pi, s);
		
		close(conn);
		
		return list;
	}

	
	// 태그가 달리지 않은 영화 목록 리스트
	public ArrayList<MovieTag> selectMovieTagList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<MovieTag> list = new ManagerDao().selectMovieTagList(conn, pi);
		
		close(conn);
		
		return list;
	}

	// 태그가 달리지 않은 영화 목록 갯수
	public int countNotMovieTag() {
		Connection conn = getConnection();
		
		int countNotMovieTag = new ManagerDao().countNotMovieTag(conn);
		
		close(conn);
		
		return countNotMovieTag;
	}

	// 영화 태그 등록을 위한 영화 정보
	public MovieVO selectMovie(String m_code) {
		Connection conn = getConnection();
		
		MovieVO movie = new ManagerDao().selectMovie(conn, m_code);
		
		close(conn);
		
		return movie;
	}

	// 영화에 태그 달기
	public int addMovieTag(String tagId, String movieCode) {
		Connection conn = getConnection();
		
		int result = new ManagerDao().addMovieTag(conn, tagId, movieCode);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 태그 1개 선택
	public Tag selectTag(int tagNo) {
		Connection conn = getConnection();
		
		Tag tag = new ManagerDao().selectTag(conn, tagNo);
		
		close(conn);
		
		return tag;
	}

	// tagNo 태그가 달린 영화 목록 리스트
	public ArrayList<MovieTag> selectInTagMovieList(PageInfo pi, int tagNo) {
		Connection conn = getConnection();
		
		ArrayList<MovieTag> list = new ManagerDao().selectInTagMovieList(conn, pi, tagNo);
		
		close(conn);
		
		return list;
	}

	// tagNo 태그가 달린 영화 갯수
	public int countInMovieTag(int tagNo) {
		Connection conn = getConnection();
		
		int countInMovieTag = new ManagerDao().countInMovieTag(conn, tagNo);
		
		close(conn);
		
		return countInMovieTag;
	}

	// m_code가 가지고 있는 태그 목록
	public ArrayList<MovieTag> selectMovieTag(String m_code) {
		Connection conn = getConnection();
		
		ArrayList<MovieTag> movieTag = new ManagerDao().selectMovieTag(conn, m_code);
		
		close(conn);
		
		return movieTag;
	}

	// 영화에 등록 된 태그 삭제
	public int deleteMovieTag(String tagId, String movieCode) {
		Connection conn = getConnection();
		
		int result = new ManagerDao().deleteMovieTag(conn, tagId, movieCode);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
