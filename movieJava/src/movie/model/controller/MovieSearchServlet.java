package movie.model.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.crawl.Netflix;
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
		boolean chkNetflix = false;
		
		Search filter = new Search(search, genre, sort);
		ArrayList<MovieVO> list = new MovieService().selectSearchMovie(filter);
		System.out.println(list);
		
		String crawling = new Netflix().netflixCrawling(search);
		
		String[] cArr = crawling.split(",");
		for(int i = 0; i < list.size(); i++) {
			for(int j = 0; j < cArr.length; j++) {
				if(cArr[j].contains(list.get(i).getM_title())) {
					chkNetflix = true;
					System.out.println(list.get(i).getM_title() + "" + chkNetflix);
				}
			}
		}
		System.out.println(crawling);
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
