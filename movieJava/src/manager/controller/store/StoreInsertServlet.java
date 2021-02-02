package manager.controller.store;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import manager.model.service.ManagerService;
import store.model.vo.Store;

/**
 * Servlet implementation class StoreInsertServlet
 */
@WebServlet("/manager/storeInsert")
public class StoreInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024*1024*10;
			
			// 웹 서버 컨테이너 경로
			String root = request.getSession().getServletContext().getRealPath("/");
			
			String savePath = root + "resources\\uploadFiles\\";
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// DB에 저장하기 위한
			String originFiles = "";
			String changeFiles = "";
			
			// multipartRequest로 부터 파일에 관한 정보 추출
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				// 파일이 null이 아닌 경우(input으로 파일이 넘어온 경우)
				if(multiRequest.getFilesystemName(name) != null) {
					// rename 된 파일명 list에 넣기
					changeFiles = multiRequest.getFilesystemName(name);
					// origin 파일명 list에 넣기
					originFiles = multiRequest.getOriginalFileName(name);
				}
			}
			
			// Store에 저장할 파일 관련 값
			Store st = new Store();
			
			st.setStorePath("/resources/uploadFiles/");
			st.setOriginName(originFiles);
			st.setRename(changeFiles);
			
			// Store에 저장할 상품 관련 값
			String storeTitle = multiRequest.getParameter("pName");
			String storeContent = multiRequest.getParameter("pContent");
			String storePrice = multiRequest.getParameter("pPrice");		// sql varchar2
			int storeQuantity = Integer.parseInt(multiRequest.getParameter("pQuantity"));
			int storeCategory = Integer.parseInt(multiRequest.getParameter("pCategory"));
			
			st.setStoreTitle(storeTitle);
			st.setStoreContent(storeContent);
			st.setStorePrice(storePrice);
			st.setStoreQuantity(storeQuantity);
			st.setStCategory(storeCategory);
			
			int result = new ManagerService().insertStore(st);
			
			if(result > 0) {
				request.setAttribute("msg", "상품 등록이 완료되었습니다.");
				request.getRequestDispatcher("/views/manager/detailsView/product1_insert.jsp").forward(request, response);
			} else {
				File failedFile = new File(savePath + changeFiles);
				failedFile.delete();
				
				request.setAttribute("msg", "상품 등록에 실패하였습니다.");
				request.getRequestDispatcher("/views/manager/detailsView/product1_insert.jsp").forward(request, response);
			}
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
