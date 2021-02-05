package manager.controller.payment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.model.service.ManagerService;
import payment.model.vo.Payment;

/**
 * Servlet implementation class PaymentDetailServlet
 */
@WebServlet("/manager/paymentDetail")
public class PaymentDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ord_no = Integer.parseInt(request.getParameter("ord_no"));
		
		Payment payment = new ManagerService().selectPayment(ord_no);
		if(payment != null) {
			request.setAttribute("payment", payment);
		} else {
			request.setAttribute("msg", "결제 세부정보 조회에 실패하였습니다.");
		}
		request.getRequestDispatcher("/views/manager/detailsView/paymentDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
