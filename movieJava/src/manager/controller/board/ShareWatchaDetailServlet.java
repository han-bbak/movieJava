package manager.controller.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.vo.Board;
import manager.model.service.ManagerService;

/**
 * Servlet implementation class ShareWatchaDetailServlet
 */
@WebServlet("/manager/watchaDetail")
public class ShareWatchaDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShareWatchaDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int brdNo = Integer.parseInt(request.getParameter("brdNo"));
		
		Board b = new ManagerService().selectBoard(brdNo);
		
		if(b != null) {
			request.setAttribute("board", b);
			request.getRequestDispatcher("/views/manager/detailsView/watchaDetailView.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "게시글 조회에 실패했습니다.");
			request.getRequestDispatcher("/views/manager/content4_2_shareWatcha.jsp").forward(request, response);
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
