package movie.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import movie.model.service.MovieService;
import movie.model.vo.MovieVO;
import movie.model.vo.Search;

/**
 * Servlet implementation class MovieSearchServlet
 */
@WebServlet("/movie/search")
public class MovieSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		String genre = request.getParameter("genre");
		String sort = request.getParameter("sort");
		
		Search filter = new Search(search, genre, sort);
		ArrayList<MovieVO> list = new MovieService().selectSearchMovie(filter);
		System.out.println(list);
		request.setAttribute("list", list);
		RequestDispatcher view = request.getRequestDispatcher("/views/movie/search/result.jsp");
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
