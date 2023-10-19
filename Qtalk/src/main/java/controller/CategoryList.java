package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CategoryListService;
import service.CategoryListServiceImpl;

/**
 * Servlet implementation class CategoryList
 */
@WebServlet("/categorylist")
public class CategoryList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryList() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		try {
			CategoryListService categoryListService = new CategoryListServiceImpl();
			String firstCategoryValue = request.getParameter("firstValue");
			List<String> firstCategory = categoryListService.getMdtoOd(firstCategoryValue);
				
			response.getWriter().print(firstCategory);
		
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());	
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.getRequestDispatcher("testschedule").forward(request, response);
	}

}