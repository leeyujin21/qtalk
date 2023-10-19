package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ExamInfo;
import dto.ExamSchedule;
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
		
			
		try {
			CategoryListService categoryListService = new CategoryListServiceImpl();
			List<ExamInfo> firstCategoryList = categoryListService.getFirstCategoryList();
			List<ExamInfo> secondCategoryList = categoryListService.getSecoundCategoryList();
			List<ExamInfo> allCategoryList = categoryListService.getAllCategoryList();
			//대분류 중복되는 DB 값 빼고출력
			request.setAttribute("firstCategoryList", firstCategoryList);
			//examinfo 모든 리스트 출력
			/* request.setAttribute("allCategoryList", allCategoryList); */
			
			//시험 스케쥴(날짜 회차) 나오는 거
			ExamScheduleService examScheduleService = new ExamScheduleServiceImpl();
			List<ExamSchedule> examScheduleList = examScheduleService.getExamScheduleRounds();
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("testschedule.jsp").forward(request, response);
	}

}
