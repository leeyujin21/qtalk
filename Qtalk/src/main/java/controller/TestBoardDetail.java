package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Member;
import dto.TestBoard;
import service.TestBoardService;
import service.TestBoardServiceImpl;

/**
 * Servlet implementation class BoardDetail
 */
@WebServlet("/testboarddetail")
public class TestBoardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestBoardDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer num = 2;
//		Integer.parseInt(request.getParameter("num"));
		try {
			TestBoardService testBoardService = new TestBoardServiceImpl();
			TestBoard testboard = testBoardService.boardDetail(num);
			request.setAttribute("testboard",testboard);
			HttpSession session = request.getSession();
			Member member = (Member)session.getAttribute("user");
			request.getRequestDispatcher("testboardpost.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("testboardpost.jsp").forward(request, response);
		}
	
	}

}
