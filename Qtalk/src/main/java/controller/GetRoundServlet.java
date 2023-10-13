package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ExamScheduleService;
import service.ExamScheduleServiceImpl;

/**
 * Servlet implementation class GetRoundServlet
 */
@WebServlet("/getroundservlet")
public class GetRoundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetRoundServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String subject = request.getParameter("subject");
		

		try {
			ExamScheduleService examshceduleService = new ExamScheduleServiceImpl();
			List<Object> round = examshceduleService.selectRoundList(subject);
			System.out.println(round);
			response.getWriter().print(round);
			
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print("error!");
		}
	}

}
