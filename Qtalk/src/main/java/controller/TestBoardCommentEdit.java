package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.javassist.expr.NewExpr;

import dto.TestBoardComment;
import service.TestBoardCommentService;
import service.TestBoardCommentServiceImpl;

/**
 * Servlet implementation class TestBoardCommentEdit
 */
@WebServlet("/testboardcommentedit")
public class TestBoardCommentEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestBoardCommentEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		TestBoardComment testBoardComment = new TestBoardComment();
		TestBoardCommentService testBoardCommentService = new TestBoardCommentServiceImpl();
		try {
			Integer comment_num= Integer.parseInt(request.getParameter("num"));
			testBoardComment = testBoardCommentService.boardCommentSelectOne(comment_num);
			testBoardCommentService.boardDelete(comment_num);
			response.sendRedirect("testboarddetail?num="+(testBoardComment.getPost_num()));
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	
	
	
}