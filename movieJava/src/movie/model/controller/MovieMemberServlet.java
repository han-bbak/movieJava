package movie.model.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interest.model.service.InterestService;
import interest.model.vo.Interest;
import member.model.vo.Member;
import movie.MovieVO;
import movie.model.service.MovieService;

/**
 * Servlet implementation class MovieMemberServlet
 */
@WebServlet("/mypage/movie")
public class MovieMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		Interest interest = new InterestService().interestSelect(loginUser.getMemId());
		MovieVO movie = new MovieService().movieSelect(loginUser.getMemId());
		System.out.println(interest);
		System.out.println(movie);
		if(movie != null) {
			request.setAttribute("movie", movie);
		}
		if(interest != null) {
			request.setAttribute("interest", interest);
		}
		request.getRequestDispatcher("/views/mypage/mypageInterest.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
