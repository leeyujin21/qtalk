package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.FreeBoard;
import dto.FreeBoardComment;
import dto.Member;
import service.FreeBoardCommentService;
import service.FreeBoardCommentServiceImpl;
import service.FreeBoardService;
import service.FreeBoardServiceImpl;

/**
 * Servlet implementation class BoardDetail
 */
@WebServlet("/freeboarddetail")
public class FreeBoardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer postnum ;
		postnum =Integer.parseInt(request.getParameter("num"));
		try {
			FreeBoardService freeBoardService = new FreeBoardServiceImpl();
			FreeBoard freeBoard = freeBoardService.FreeBoardDetail(postnum);
			FreeBoardCommentService freeBoardCommentService = new FreeBoardCommentServiceImpl();
			List<FreeBoardComment> freeBoardCommentList = freeBoardCommentService.boardCommentSelect(postnum);
			
			request.setAttribute("freeboard",freeBoard);
			request.setAttribute("freeboardCommentList",freeBoardCommentList);
			
			HttpSession session = request.getSession();
			Member member = (Member)session.getAttribute("member");
			
			request.getRequestDispatcher("freeboardpost.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Integer postnum= Integer.parseInt(request.getParameter("comment_board"));
		String writer= request.getParameter("comment_id");			
		String content= request.getParameter("comment_content");
		
		FreeBoardComment freeBoardComment = new FreeBoardComment();
		freeBoardComment.setPost_num(postnum);
		freeBoardComment.setWriter(writer);
		freeBoardComment.setContent(content);
		
		try {
			FreeBoardCommentService freeBoardCommentService = new FreeBoardCommentServiceImpl();
			freeBoardCommentService.boardCommentWrite(freeBoardComment);
			response.sendRedirect("freeboarddetail?num="+freeBoardComment.getPost_num());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
