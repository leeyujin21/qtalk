package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Member;
import dto.TestBoard;
import dto.TestBoardComment;
import service.TestBoardCommentService;
import service.TestBoardCommentServiceImpl;
import service.TestBoardService;
import service.TestBoardServiceImpl;

/**
 * Servlet implementation class BoardDetail
 */
@WebServlet("/testboarddetail")
public class TestBoardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestBoardDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer postnum ;
		postnum =Integer.parseInt(request.getParameter("num"));
		try {
			TestBoardService testBoardService = new TestBoardServiceImpl();
			TestBoard testboard = testBoardService.TestBoardDetail(postnum);
			TestBoardCommentService testBoardCommentService = new TestBoardCommentServiceImpl();
			List<TestBoardComment> testBoardCommentList = testBoardCommentService.boardCommentSelect(postnum);
			
			request.setAttribute("testboard",testboard);
			request.setAttribute("testboardCommentList",testBoardCommentList);
			
			HttpSession session = request.getSession();
			Member member = (Member)session.getAttribute("member");
			
			request.getRequestDispatcher("testboardpost.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Integer postnum= Integer.parseInt(request.getParameter("comment_board"));
		String writer =  request.getParameter("comment_id");
		String content= request.getParameter("comment_content");
		
		TestBoardComment testBoardComment = new TestBoardComment();
		testBoardComment.setPost_num(postnum);
		testBoardComment.setWriter(writer);
		testBoardComment.setContent(content);
		
		try {
			TestBoardCommentService testBoardCommentService = new TestBoardCommentServiceImpl();
			testBoardCommentService.boardCommentWrite(testBoardComment);
			response.sendRedirect("testboarddetail?num="+testBoardComment.getPost_num());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
