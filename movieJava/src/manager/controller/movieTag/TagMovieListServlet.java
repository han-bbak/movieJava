package manager.controller.movieTag;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.model.service.ManagerService;
import manager.model.vo.PageInfo;
import movieTag.model.vo.MovieTag;
import tag.model.vo.Tag;

/**
 * Servlet implementation class TagMovieListServlet
 */
@WebServlet("/manager/tagMovieList")
public class TagMovieListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TagMovieListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tagNo = Integer.parseInt(request.getParameter("tagNo"));
		
		ManagerService ms = new ManagerService();
		
		Tag tag = ms.selectTag(tagNo);
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int countInMovieTag = ms.countInMovieTag(tagNo);
		
		int pageLimit = 10;
		int listLimit = 5;
		int maxPage;
		int startPage;
		int endPage;
		
		maxPage = (int)Math.ceil((double)countInMovieTag / listLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, countInMovieTag, pageLimit, listLimit, maxPage, startPage, endPage);
		
		ArrayList<MovieTag> list = ms.selectInTagMovieList(pi, tagNo);
		
		request.setAttribute("list", list);
		request.setAttribute("tag", tag);
		request.setAttribute("pi", pi);
		
		request.getRequestDispatcher("/views/manager/detailsView/MovieTagList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
