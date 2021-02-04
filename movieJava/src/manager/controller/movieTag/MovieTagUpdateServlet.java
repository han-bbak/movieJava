package manager.controller.movieTag;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.model.service.ManagerService;
import movie.model.vo.MovieVO;
import movieTag.model.vo.MovieTag;
import tag.model.vo.Tag;

/**
 * Servlet implementation class MovieTagUpdateServlet
 */
@WebServlet("/manager/movieTagUpdate")
public class MovieTagUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieTagUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String m_code = request.getParameter("m_code");
		
		ArrayList<MovieTag> movieTag = new ManagerService().selectMovieTag(m_code);
		MovieVO movie = new ManagerService().selectMovie(m_code);
		ArrayList<Tag> tag = new ManagerService().selectTagList();
		
		request.setAttribute("tag", tag);
		request.setAttribute("movieTag", movieTag);
		request.setAttribute("movie", movie);
		request.getRequestDispatcher("/views/manager/detailsView/movieTagUpdate.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
