package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.FreeBoardService;
import service.FreeBoardServiceImpl;

/**
 * Servlet implementation class FreeBoardSearch
 */
@WebServlet("/freeboardsearch")
public class FreeBoardSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardSearch() {
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
			response.sendRedirect("freeboard");
			return;
		}
		
		try {
			FreeBoardService freeboardService = new FreeBoardServiceImpl();
			Map<String, Object> res  = freeboardService.FreeBoardSearch(type,keyword,curpage);
			request.setAttribute("res", res);
			request.getRequestDispatcher("freeboard.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "검색실패" );
			request.getRequestDispatcher("error.jsp").forward(request, response);		
			}
	}

}
