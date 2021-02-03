package moviedetail.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import moviedetail.model.service.MovieService;

/**
 * Servlet implementation class Starmain
 */
@WebServlet("/Star")
public class Starmain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Starmain() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unused")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   int stargrade =Integer.parseInt(request.getParameter("stargrade"));
	  	   //회원번호 영화코드 별점이 필요 테이블에 인서트하기위해   
		  String Movievo = request.getParameter("MovieVo"); 
//		  int memberno =  Integer.parseInt( request.getParameter("memberno"));
		  HttpSession session = request.getSession();
		  Member member = (Member)session.getAttribute("loginUser");
		  int memberno=member.getMemNo();
		   int result=new MovieService().insertStarGrade(stargrade,Movievo,memberno);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	      
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
