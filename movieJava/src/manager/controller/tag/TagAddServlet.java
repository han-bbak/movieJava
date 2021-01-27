package manager.controller.tag;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.model.service.ManagerService;
import tag.model.vo.Tag;

/**
 * Servlet implementation class TagAddServlet
 */
@WebServlet("/manager/addTag")
public class TagAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TagAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String tagName = request.getParameter("addTagName");
		
		int result = new ManagerService().addTag(tagName);
		
		ArrayList<Tag> list = new ManagerService().selectTagList();
		request.setAttribute("list", list);
		
		if(result <= 0) {
			request.setAttribute("msg", "태그 등록에 실패하였습니다.");
		}
		
		request.getRequestDispatcher("/views/manager/content1_4_tagManager.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
