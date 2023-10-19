package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ExamSchedule;
import service.ExamScheduleService;
import service.ExamScheduleServiceImpl;

/**
 * Servlet implementation class TestScheduleSearch
 */
@WebServlet("/testschedulesearch")
public class TestScheduleSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestScheduleSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String search = request.getParameter("search");
		System.out.println(search);
		
		try {
			ExamScheduleService examScheduleService = new ExamScheduleServiceImpl();
			List<ExamSchedule> examScheduleList = examScheduleService.searchSchedule(search);
			System.out.println(examScheduleList.size());
			System.out.println(examScheduleList.get(0));
			request.setAttribute("examScheduleList", examScheduleList);
			request.getRequestDispatcher("testschedule.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("testschedule.jsp").forward(request, response);
		}
	}

}
