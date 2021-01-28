package manager.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.model.service.ManagerService;

/**
 * Servlet implementation class BoardRemoveServlet
 */
@WebServlet("/manager/boardRemove")
public class BoardRemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardRemoveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int brdNo = Integer.parseInt(request.getParameter("removeBoardNo"));
		
		System.out.println(brdNo);
		
		int result = new ManagerService().removeBoard(brdNo);
		
		System.out.println(result);
		
		
		
		if(result > 0) {
			request.setAttribute("msg", "해당 게시글을 삭제했습니다.");
			request.getRequestDispatcher("/manager/shareNetflix").forward(request, response);
		} else {
			request.setAttribute("msg", "해당 게시글 삭제에 실패했습니다.");
			request.getRequestDispatcher("/views/manager/content4_share.jsp").forward(request, response);
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
