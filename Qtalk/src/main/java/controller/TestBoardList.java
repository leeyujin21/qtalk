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
 * Servlet implementation class TestBoardList
 */
@WebServlet("/testboard")
public class TestBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TestBoardList() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String page = request.getParameter("page");
		int curpage = 1;
		if (page != null) {
			curpage = Integer.parseInt(page);
		}
		try {
			TestBoardService testBoardService = new TestBoardServiceImpl();
			Map<String, Object> res = testBoardService.TestBoardListByPage(curpage);
			request.setAttribute("res", res);
			request.getRequestDispatcher("testboard.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("testboard.jsp").forward(request, response);
		}
	}

}
