package board.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.Reply;

/**
 * Servlet implementation class netflixDetailServlet
 */
@WebServlet("/netflix/detail")
public class netflixDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public netflixDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int brd_no = Integer.parseInt(request.getParameter("brd_no"));
		
		boolean flagbList = false;
		boolean flagbrd_no = false;
		
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals("bList")) {
					flagbList = true;
					
					String bList = URLDecoder.decode(c.getValue(), "UTF-8");
					String[] list = bList.split(",");
					for(String st : list) {
						if(st.equals(String.valueOf(brd_no)))
							flagbrd_no = true;
					}
					if(!flagbrd_no) {
						c.setValue(URLEncoder.encode(bList + "," + brd_no, "UTF-8"));
						response.addCookie(c);
					}
				}
			}
		}
		
		BoardService bs = new BoardService();
		Board b = null;
		
		if(!flagbList) {
			Cookie c = new Cookie("bList", String.valueOf(brd_no));
			c.setMaxAge(1 * 24 * 60 * 60);
			response.addCookie(c);
			b = bs.selectBoard(brd_no);
		} else if(!flagbrd_no) {
			b = bs.selectBoard(brd_no);
		} else {
			b = bs.selectBoardNocnt(brd_no);
		}
		
		ArrayList<Reply> rList = bs.selectReplyList(brd_no);
		
		if(b != null) {
			request.setAttribute("board", b);
			request.setAttribute("rList", rList);
			request.getRequestDispatcher("/views/board/netflix_detail.jsp").forward(request, response);
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
