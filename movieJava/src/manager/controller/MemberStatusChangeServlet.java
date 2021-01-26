package manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.model.service.ManagerService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberStatusChangeServlet
 */
@WebServlet("/manager/memberStatusChange")
public class MemberStatusChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberStatusChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		String status = request.getParameter("status");
		String changeStatus = "";
		
		Member m = new ManagerService().memberStatusChange(memNo, status);
		
		if(m != null) {
			changeStatus = m.getMemStatus();
			response.setCharacterEncoding("utf-8");
			String result = changeStatus.equals("Y") ? "활동" : "정지";
			response.getWriter().print(result);
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
