package manager.controller.payment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import manager.model.service.ManagerService;

/**
 * Servlet implementation class PaymentCountServlet
 */
@WebServlet("/manager/payCount")
public class PaymentCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentCountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerService ms = new ManagerService();
		int countPay = ms.countPayment();
		int sumPay = ms.countSumPayment();
		
		JSONArray jArr = new JSONArray();
		jArr.add(countPay);
		jArr.add(sumPay);
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jArr);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
