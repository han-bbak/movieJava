package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.Service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class UpdatePwdServlet
 */
@WebServlet("/member/updatePwd")
public class UpdatePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// userId가 필요함 -> 세션에 저장 된 loginUser를 통해서 알아오자
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getMemId();
		String userPwd = request.getParameter("userPwd");	// 현재 비밀번호
		String newPwd = request.getParameter("newPwd");		// 변경할 비밀번호
		

		Member updateMember = new MemberService().updatePwd(userId, userPwd, newPwd);
		

		if(updateMember != null) {
			// 비밀번호 수정이 잘 되었음을 result-success로 표시
			request.setAttribute("result", "success");
			// 수정 된 객체 다시 loginUser에 저장
			session.setAttribute("loginUser", updateMember);
		} else {
			request.setAttribute("result", "fail");
		}
		
		RequestDispatcher view = request.getRequestDispatcher("/views/mypage/mypageMember.jsp");
		
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
