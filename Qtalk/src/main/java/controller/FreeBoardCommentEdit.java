package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.FreeBoardComment;
import service.FreeBoardCommentService;
import service.FreeBoardCommentServiceImpl;

/**
 * Servlet implementation class TestBoardCommentEdit
 */
@WebServlet("/freeboardcommentedit")
public class FreeBoardCommentEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardCommentEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		FreeBoardComment freeBoardComment = new FreeBoardComment();
		FreeBoardCommentService freeBoardCommentService = new FreeBoardCommentServiceImpl();
		try {
			Integer comment_num= Integer.parseInt(request.getParameter("num"));
			freeBoardComment = freeBoardCommentService.boardCommentSelectOne(comment_num);
			freeBoardCommentService.boardDelete(comment_num);
			response.sendRedirect("freeboarddetail?num="+(freeBoardComment.getPost_num()));
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	
	
	
}