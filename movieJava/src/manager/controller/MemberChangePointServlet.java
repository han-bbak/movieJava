package manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.model.service.ManagerService;

/**
 * Servlet implementation class MemberChangePoint
 */
@WebServlet("/manager/memberChangePoint")
public class MemberChangePointServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberChangePointServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int point = 0;
		
		if(request.getParameter("addPoint") != null) {
			point = Integer.parseInt(request.getParameter("addPoint"));
		} else {
			point = -(Integer.parseInt(request.getParameter("removePoint")));
		}
		
		int changePoint = new ManagerService().memberChangePoint(memNo, point);
		
		response.getWriter().print(changePoint);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
