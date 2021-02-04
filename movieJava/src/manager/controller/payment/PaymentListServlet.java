package manager.controller.payment;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.model.service.ManagerService;
import manager.model.vo.PageInfo;
import manager.model.vo.Search;
import payment.model.vo.Payment;

/**
 * Servlet implementation class PaymentListServlet
 */
@WebServlet("/manager/paymentList")
public class PaymentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sCondition = request.getParameter("period");
		String search = "";
		int payCount = 0;
		if(sCondition.equals("selection")) {
			String periodStart = request.getParameter("period-start");
			String periodEnd = request.getParameter("period-end");
			search = periodStart + "," + periodEnd; 
		}
		
		Search s = new Search();
		s.setSearchCondition(sCondition);
		s.setSearch(search);
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		ManagerService ms = new ManagerService();
		
		if(sCondition.equals("selection")) {
			payCount = ms.countPeriodSearchPayment(s);
		} else {
			payCount = ms.countSearchPayment(s);
		}
		
		int pageLimit = 10;
		int listLimit = 20;
		
		PageInfo pi = new PageInfo(currentPage, payCount, pageLimit, listLimit);
		
		ArrayList<Payment> list = ms.selectSearchPayment(pi, s);
		
//		System.out.println(list);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("search", s);
		
		request.getRequestDispatcher("/views/manager/detailsView/paymentListView.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
