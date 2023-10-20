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

/**
 * Servlet implementation class CategoryListSelect
 */
@WebServlet("/categorylistselect")
public class CategoryListSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CategoryListSelect() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");

		String thirdCategoryValue = request.getParameter("thirdValue");
		System.out.println(thirdCategoryValue);

		try {
			CategoryListService categoryListService = new CategoryListServiceImpl();

			List<ExamInfo> firstCategoryList = categoryListService.getFirstCategoryList();
			request.setAttribute("firstCategoryList", firstCategoryList);
			
			List<ExamSchedule> thirdCategory = categoryListService.getJm(thirdCategoryValue);
			request.setAttribute("examScheduleList", thirdCategory);
			
			request.getRequestDispatcher("testschedule.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error").forward(request, response);
		}
	}
}