package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.TestBoardService;
import service.TestBoardServiceImpl;

/**
 * Servlet implementation class TestBoardSearch
 */
@WebServlet("/testboardsearch")
public class TestBoardSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestBoardSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		String page = request.getParameter("page");
		int curpage = 1;
		if (page != null) {
			curpage = Integer.parseInt(page);
		}
		if (type.equals("all")) {
			response.sendRedirect("testboard");
			return;
		}
		
		try {
			TestBoardService testboardService = new TestBoardServiceImpl();
			Map<String, Object> res  = testboardService.TestBoardSearch(type,keyword,curpage);
			request.setAttribute("res", res);
			request.getRequestDispatcher("testboard.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "검색실패" );
			request.getRequestDispatcher("error.jsp").forward(request, response);		
			}
	
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		String page = request.getParameter("page");
		int curpage = 1;
		if (page != null) {
			curpage = Integer.parseInt(page);
		}
		if (type.equals("all")) {
			response.sendRedirect("testboard");
			return;
		}
		
		try {
			TestBoardService testboardService = new TestBoardServiceImpl();
			Map<String, Object> res  = testboardService.TestBoardSearch(type,keyword,curpage);
			request.setAttribute("res", res);
			request.getRequestDispatcher("testboard.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "검색실패" );
			request.getRequestDispatcher("error.jsp").forward(request, response);		
			}
	
	}
}
