package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.Service.MemberService;

/**
 * Servlet implementation class UpdateTempPwdServlet
 */
@WebServlet("/member/updateTempPwd")
public class UpdateTempPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTempPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("userNo"));
		String tempPwd = request.getParameter("tempPwd");
		
		int result = new MemberService().updateTempPwd(memNo, tempPwd);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/views/member/loginView.jsp");
		} else {
			request.setAttribute("msg", "임시비밀번호 변경에 실패하였습니다.");
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
