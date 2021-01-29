package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Reply;

/**
 * Servlet implementation class watchaUpdateReplyServlet
 */
@WebServlet("/watcha/updateReply")
public class watchaUpdateReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public watchaUpdateReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int rp_no = Integer.parseInt(request.getParameter("rp_no"));
		int brd_no = Integer.parseInt(request.getParameter("brd_no"));
		String rp_content = request.getParameter("rp_content");
		
		Reply r = new Reply();
		r.setRp_no(rp_no);
		r.setRp_content(rp_content);
		
		int result = new BoardService().updateReply(r);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "댓글이 수정되었습니다.");
			response.sendRedirect(request.getContextPath() + "/watcha/detail?brd_no=" + brd_no);
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
