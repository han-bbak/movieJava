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
 * Servlet implementation class ticketDetailServlet
 */
@WebServlet("/ticket/detail")
public class ticketDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ticketDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int storeNo = Integer.parseInt(request.getParameter("storeNo"));

		StoreService ss = new StoreService();
		Store s = null;
		
		s = ss.selectTicket(storeNo);
		
		if(s != null) {
			request.setAttribute("store", s);
			request.getRequestDispatcher("/views/store/store_ticket_detail.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "게시글 상세 조회에 실패하였습니다.");
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
