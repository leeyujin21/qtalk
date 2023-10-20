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
 * Servlet implementation class CategorySecondList
 */
@WebServlet("/categorysecondlist")
public class CategorySecondList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategorySecondList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String secondCategoryValue = request.getParameter("secoundValue");
		System.out.println(secondCategoryValue);
		try {
			CategoryListService categoryListService = new CategoryListServiceImpl();
			
			List<String> secondCategory = categoryListService.getOdtoJm(secondCategoryValue);
			response.getWriter().print(secondCategory);
			
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());	
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
