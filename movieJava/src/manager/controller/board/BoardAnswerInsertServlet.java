package manager.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.vo.Board;
import manager.model.service.ManagerService;
import qaAnswer.model.vo.QAAnswer;

/**
 * Servlet implementation class BoardAnswerInsertServlet
 */
@WebServlet("/manager/answerInsert")
public class BoardAnswerInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardAnswerInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int brdNo = Integer.parseInt(request.getParameter("brdNo"));
		String qaAnswer = request.getParameter("qaAnswer");
		
		QAAnswer qa = new QAAnswer();
		qa.setAnsContent(qaAnswer);
		qa.setBrdNo(brdNo);
		
		ManagerService ms = new ManagerService();
		
		int result = ms.insertAnswer(qa);
		
		Board b = ms.selectBoard(brdNo);
		
		request.setAttribute("board", b);
		
		if(result > 0) {
			int result1 = ms.changeWait(brdNo);
			if(result1 > 0) {
				request.setAttribute("msg", "답변 등록이 완료 되었습니다.");
			} else {
				request.setAttribute("msg", "답변 등록이 완료 되었으나, 답변 상태 변경에 실패했습니다.");
			}
			request.getRequestDispatcher("/views/manager/detailsView/qaAnswerInsert.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "답변 등록에 실패했습니다.");
			request.getRequestDispatcher("/views/manager/detailsView/qaAnswerInsert.jsp").forward(request, response);
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
