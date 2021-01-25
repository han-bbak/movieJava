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
 * Servlet implementation class MemberJoinServlet
 */
@WebServlet("/member/join")
public class MemberJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberJoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String birthYear = request.getParameter("birthYear");
		String birthMonth = request.getParameter("birthMonth");
		String birthday = request.getParameter("birthday");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		String[] addressArr = request.getParameterValues("address");
		
		String address = "";
		String birth = "";
		
		birth = birthYear.substring(2).concat(birthMonth).concat(birthday);
//		System.out.println(birth);
		
		if(addressArr != null) {
			address = String.join(",", addressArr);
		}
		
//		System.out.println(address);
		
		Member m = new Member(userId, userPwd, userName, birth, email, phone, address);
		
		int result = new MemberService().joinMember(m);
//		System.out.println(m);
//		System.out.println(result);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "회원가입이 완료 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/views/member/joinMember.jsp");
		} else {
			request.setAttribute("msg", "회원 가입에 실패하였습니다.");
			request.getRequestDispatcher("/views/member/joinMember.jsp").forward(request, response);
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
