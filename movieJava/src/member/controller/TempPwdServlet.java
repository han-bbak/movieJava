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
 * Servlet implementation class TempPwdServlet
 */
@WebServlet("/member/tempPwd")
public class TempPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TempPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("userNo"));
		
		Member mem = new MemberService().searchMember(memNo);
		
		if(mem != null) {
			request.setAttribute("mem", mem);
			request.getRequestDispatcher("/views/member/temporaryPwd.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "임시비밀번호 발급에 실패했습니다.");
			request.getRequestDispatcher("/views/member/pwdSearch.jsp").forward(request, response);
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
