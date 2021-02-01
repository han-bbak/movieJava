package manager.controller.movieTag;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import manager.model.service.ManagerService;

/**
 * Servlet implementation class MovieTagCountServlet
 */
@WebServlet("/manager/movieTagCount")
public class MovieTagCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieTagCountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerService ms = new ManagerService();
		int countMovie = ms.countMovie();
		int countNotMovieTag = ms.countNotMovieTag();
		
		JSONArray jArr = new JSONArray();
		
		jArr.add(countMovie);
		jArr.add(countNotMovieTag);
		
		response.setContentType("application/json; charset=UTF-8"); 
		response.getWriter().print(jArr);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
