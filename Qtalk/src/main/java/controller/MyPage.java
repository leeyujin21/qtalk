package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.ExamSchedule;
import dto.Member;
import dto.TestBoard;
import service.BookMarkService;
import service.BookMarkServiceImpl;
import service.TestBoardService;
import service.TestBoardServiceImpl;

/**
 * Servlet implementation class MyPage
 */
@WebServlet("/mypage")
public class MyPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		//  로그인 상태 여부 확인
		Member member = (Member)session.getAttribute("member");
		if(member == null) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		try {
			BookMarkService bookMarkService = new BookMarkServiceImpl();
			List<ExamSchedule> examScheduleList = bookMarkService.selectBookMark(member.getId());
			request.setAttribute("examScheduleList", examScheduleList);
			request.getRequestDispatcher("mypage.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("mypage.jsp").forward(request, response);
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
}
