package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.TestBoard;
import service.TestBoardService;
import service.TestBoardServiceImpl;

/**
 * Servlet implementation class TestBoardModify
 */
@WebServlet("/testboardmodify")
public class TestBoardModify extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TestBoardModify() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer num = Integer.parseInt(request.getParameter("num"));

		try {
			TestBoardService testboardService = new TestBoardServiceImpl();
			TestBoard testboard = testboardService.TestBoardDetail(num);
			request.setAttribute("testboard", testboard);
			request.getRequestDispatcher("testboardmodify.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "게시글 수정 실패");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String uploadPath = request.getServletContext().getRealPath("upload");
		int size = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8",
				new DefaultFileRenamePolicy());

		Integer num = Integer.parseInt(multi.getParameter("num"));
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String fileUrl = multi.getOriginalFileName("file");
		String subject = multi.getParameter("subject");
		String round = multi.getParameter("round");

		TestBoard testboard = new TestBoard();
		testboard.setNum(num);
		testboard.setTitle(title);
		testboard.setContent(content);
		testboard.setFileurl(fileUrl);
		testboard.setSubject(subject);
		testboard.setRound(round);

		try {
			TestBoardService testboardService = new TestBoardServiceImpl();
			testboardService.TestBoardModify(testboard);
			response.sendRedirect("testboard.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "게시글 수정 오류");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
}