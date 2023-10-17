package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ExamInfo;
import dto.FreeBoardComment;
import service.CategoryListService;
import service.CategoryListServiceImpl;
import service.FreeBoardCommentService;
import service.FreeBoardCommentServiceImpl;

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
		request.getRequestDispatcher("testschedule.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.getRequestDispatcher("testschedule.jsp").forward(request, response);
	}

}
