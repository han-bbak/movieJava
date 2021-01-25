package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.Service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class IdSearchServlet
 */
@WebServlet("/member/idSearch")
public class IdSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String userName = request.getParameter("userName");
		String birth = request.getParameter("userPNo");
		String email = request.getParameter("userEmail");
		
		Member m = new Member();
		m.setMemName(userName);
		m.setMemBirth(birth);
		m.setEmail(email);
//		System.out.println(m);
		
		Member mem = new MemberService().idSearch(m);
//		System.out.println(mem);
		
		if(mem != null) {
			request.setAttribute("mem", mem);
			request.getRequestDispatcher("/views/member/idSearchResult.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "아이디 조회에 실패하였습니다.");
			request.getRequestDispatcher(request.getContextPath() + "/views/member/idSearch.jsp").forward(request, response);
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
