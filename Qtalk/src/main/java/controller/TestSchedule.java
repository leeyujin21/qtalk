package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.BookMark;
import dto.ExamInfo;
import dto.ExamSchedule;
import dto.Member;
import service.BookMarkService;
import service.BookMarkServiceImpl;
import service.CategoryListService;
import service.CategoryListServiceImpl;
import service.ExamScheduleService;
import service.ExamScheduleServiceImpl;

/**
 * Servlet implementation class TestSchedule
 */
@WebServlet("/testschedule")
public class TestSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestSchedule() {
        super();
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
			HttpSession session =request.getSession();
			Member member = (Member)session.getAttribute("member");
			
		try {
			CategoryListService categoryListService = new CategoryListServiceImpl();
			List<ExamInfo> firstCategoryList = categoryListService.getFirstCategoryList();
			//대분류 중복되는 DB 값 빼고출력
			request.setAttribute("firstCategoryList", firstCategoryList);
      
			//시험 스케쥴(날짜 회차) 나오는 거
			ExamScheduleService examScheduleService = new ExamScheduleServiceImpl();
			List<ExamSchedule> examScheduleList = examScheduleService.getExamScheduleRounds();
			
			
			//해당 아이디에 북마크가 저장 되었을경우 북마크 리스트로 보내줌
			if (member != null) {
				String id =member.getId();
				BookMarkService bookMarkService = new BookMarkServiceImpl();
				List<ExamSchedule> bookMarkList = bookMarkService.selectBookMark(id);
				if (bookMarkList != null) {
					request.setAttribute("bookMarkList", bookMarkList);
				}}
			
			
			
			request.setAttribute("examScheduleList", examScheduleList);
			request.getRequestDispatcher("testschedule.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
//		try {
//			response.sendRedirect("testschedule");
//		} catch (Exception e) {
//			request.setAttribute("err", e.getMessage());
//			request.getRequestDispatcher("error.jsp").forward(request, response);
//		}
//	}

}
