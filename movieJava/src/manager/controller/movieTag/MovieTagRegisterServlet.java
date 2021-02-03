package manager.controller.movieTag;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.model.service.ManagerService;
import movie.MovieVO;
import tag.model.vo.Tag;

/**
 * Servlet implementation class MovieTagRegisterServlet
 */
@WebServlet("/manager/tagRegister")
public class MovieTagRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieTagRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String m_code = request.getParameter("m_code");
		
		MovieVO movie = new ManagerService().selectMovie(m_code);
		
		ArrayList<Tag> list = new ManagerService().selectTagList();
		
		request.setAttribute("list", list);
		request.setAttribute("movie", movie);
		
		request.getRequestDispatcher("/views/manager/detailsView/movieTagRegister.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
