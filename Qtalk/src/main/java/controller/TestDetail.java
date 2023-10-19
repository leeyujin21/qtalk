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
 * Servlet implementation class TestDetail
 */
@WebServlet("/testdetail")
public class TestDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TestDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Integer num = Integer.parseInt(request.getParameter("num"));
		
		try {
			ExamScheduleService examScheduleService = new ExamScheduleServiceImpl();
			ExamSchedule examDetail = examScheduleService.selectTestDetail(num);
			request.setAttribute("examDetail", examDetail);
			System.out.println(examDetail.getJmfldnm());
			request.getRequestDispatcher("testdetail.jsp").forward(request, response);
			
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());	
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}

	}
}
