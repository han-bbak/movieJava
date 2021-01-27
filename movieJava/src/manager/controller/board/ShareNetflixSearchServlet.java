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
import board.model.vo.PageInfo;
import manager.model.vo.Search;

/**
 * Servlet implementation class ShareNetflixSearchServlet
 */
@WebServlet("/manager/searchNetflix")
public class ShareNetflixSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShareNetflixSearchServlet() {
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
		
		int storeCount = ms.countSearchNetflix(s);
		
		int pageLimit = 10;
		int listLimit = 20;
		
		PageInfo pi = new PageInfo(currentPage, storeCount, pageLimit, listLimit);
		
		ArrayList<Board> list = ms.selectSearchNetflix(pi, s);
		
//		System.out.println(list);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("search", s);
		
		request.getRequestDispatcher("/views/manager/content4_share.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
