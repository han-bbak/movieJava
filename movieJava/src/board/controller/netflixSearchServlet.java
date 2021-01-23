package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.PageInfo;
import board.model.vo.Search;

/**
 * Servlet implementation class netflixSearchServlet
 */
@WebServlet("/netflix/search")
public class netflixSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public netflixSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Search s = new Search(request.getParameter("searchCondition"),  request.getParameter("search"));
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		BoardService bs = new BoardService();
		int listCount = bs.getSearchListCount(s);
		
//		System.out.println("검색 기준: " + s);
//		System.out.println("검색 기준 listCount: " + listCount);
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit);
		
		ArrayList<Board> list = bs.selectSearchList(pi, s);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("search", s);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/board/netflix.jsp");
		view.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
