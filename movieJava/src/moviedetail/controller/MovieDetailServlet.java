package moviedetail.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.model.vo.MovieVO;
import moviedetail.model.service.MovieService;

/**
 * Servlet implementation class movedetailservlet
 */
@WebServlet("/movie/detail")
public class MovieDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mCode = request.getParameter("mCode");
		MovieVO movie = new MovieService().selectMovie(mCode);
		System.out.println(movie);
		
		if(movie != null) {
			request.setAttribute("movie", movie);
			request.getRequestDispatcher("/views/moviedetail/Moviedetails.jsp").forward(request, response);
		}else {
			System.out.println("오류발생");
		}
		
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
