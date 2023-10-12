package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.OneLineBoardService;
import service.OneLineBoardServiceImpl;

/**
 * Servlet implementation class OneLineBoardSearch
 */
@WebServlet("/onelineboardsearch")
public class OneLineBoardSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OneLineBoardSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String type = request.getParameter("type"); // 기사이름2
		String keyword = request.getParameter("keyword"); // 검색어
		String page = request.getParameter("page"); // 현재 페이지
		int curPage = 1;
		if(page!=null) {
			curPage = Integer.parseInt(page);
		}
		
		if(type.equals("all")) {
			response.sendRedirect("onelineboardpost");
		}
		try {
			OneLineBoardService oneLineBoardService = new OneLineBoardServiceImpl();
			Map<String,Object> res = oneLineBoardService.oneLineBoardSearch(type, keyword, curPage);
			request.setAttribute("res", res);
			request.getRequestDispatcher("onelineboard.jsp").forward(request, response);			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "게시판 검색 오류");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
