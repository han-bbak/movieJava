package payment.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import payment.model.service.PaymentService;
import payment.model.vo.Payment;

/**
 * Servlet implementation class PaymentMemberServlet
 */
@WebServlet("/mypage/payment")
public class PaymentMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		Payment pay = new PaymentService().paymentSelect(loginUser.getMemId());
		
		if(pay != null) {
			request.setAttribute("payment", pay);
		}
		request.getRequestDispatcher("/views/mypage/mypagePay.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}