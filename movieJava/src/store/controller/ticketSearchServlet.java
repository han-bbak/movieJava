package store.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import store.model.service.StoreService;
import store.model.vo.PageInfo;
import store.model.vo.Search;

import store.model.vo.Store;
/**
 * Servlet implementation class storeSearchServlet
 */
@WebServlet("/ticket/search")
public class ticketSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ticketSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		
		Search s = new Search();
		s.setSearch(search);
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		StoreService ss = new StoreService();
		int listCount = ss.getSearchListCount1(s);
		
//		System.out.println("검색 기준: " + s);
//		System.out.println("검색 기준 listCount: " + listCount);
		
		int pageLimit = 10;
		int boardLimit = 6;
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit);
		
		ArrayList<Store> list = ss.selectSearchList1(pi, s);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("search", s);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/store/store_ticket.jsp");
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
