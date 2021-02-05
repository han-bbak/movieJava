package point.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interest.model.service.InterestService;
import interest.model.vo.Interest;
import member.model.vo.Member;
import movie.model.vo.MovieVO;
import movie.model.service.MovieService;
import point.model.service.PointService;
import point.model.vo.Point;

/**
 * Servlet implementation class PointMemberServlet
 */
@WebServlet("/mypage/point")
public class PointMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PointMemberServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");

		Point point = new PointService().interestSelect(loginUser.getMemId());
		PointService ps = new PointService();


		ArrayList<Point> pList = ps.selectPointList(loginUser.getMemId());

		if( point != null ) {
			request.setAttribute("point", point);
		}
		if (pList != null) {

			request.setAttribute("pList", pList);
			//request.getRequestDispatcher("/views/mypage/mypagePoint.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "실패");
		}
		
		
		request.getRequestDispatcher("/views/mypage/mypagePoint.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
