package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.BookMark;
import service.BookMarkService;
import service.BookMarkServiceImpl;

/**
 * Servlet implementation class BookMarkWrite
 */
@WebServlet("/bookmarkedit")
public class BookMarkEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookMarkEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		BookMarkService bookMarkService = new BookMarkServiceImpl();
		
		Integer exNum = Integer.parseInt(request.getParameter("num"));
		String id = request.getParameter("id");
		
		BookMark bookMark = new BookMark();
		bookMark.setExnum(exNum);
		bookMark.setId(id);
		try {
		if (bookMarkService.isSelectBookMark(bookMark) ==null) {
			bookMarkService.insertBookMark(bookMark);
		}else {
			bookMarkService.deleteBookMark(bookMark);
		}
			response.sendRedirect("testschedule");
		} catch (Exception e) {
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	

}
