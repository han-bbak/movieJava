package manager.controller.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.vo.Board;
import manager.model.service.ManagerService;
import manager.model.vo.PageInfo;
import manager.model.vo.Search;

/**
 * Servlet implementation class ShareWatchaSearchServlet
 */
@WebServlet("/manager/searchWatcha")
public class ShareWatchaSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShareWatchaSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		
		Search s = new Search();
		s.setSearch(search);
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		ManagerService ms = new ManagerService();
		
		int watchaCount = ms.countSearchWatcha(s);
		
		int pageLimit = 10;
		int listLimit = 20;
		
		PageInfo pi = new PageInfo(currentPage, watchaCount, pageLimit, listLimit);
		
		ArrayList<Board> list = ms.selectSearchWatcha(pi, s);
		
//		System.out.println(list);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("search", s);
		
		request.getRequestDispatcher("/views/manager/content4_2_shareWatcha.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
