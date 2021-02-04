package store.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import store.model.service.StoreService;
import store.model.vo.Store;

/**
 * Servlet implementation class goodsPaymentServlet
 */
@WebServlet("/goods/payment")
public class goodsPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public goodsPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String storeTitle = request.getParameter("storeTitle");
		int storeNo = Integer.parseInt(request.getParameter("storeNo"));
		int selQuan = Integer.parseInt(request.getParameter("selQuan"));
		int price = Integer.parseInt(request.getParameter("price"));
		int realprice = Integer.parseInt(request.getParameter("price")) + 3000;
		
		request.setAttribute("storeTitle", storeTitle);
		request.setAttribute("storeNo", storeNo);
		request.setAttribute("selQuan", selQuan);
		request.setAttribute("total", price);
		request.setAttribute("rtotal", realprice);
		request.getRequestDispatcher("/views/store/payment.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
