package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.ExamInfo;
import dto.ExamSchedule;
import dto.FreeBoard;
import dto.Member;
import dto.TestBoard;
import service.ExamInfoService;
import service.ExamInfoServiceImpl;
import service.ExamScheduleService;
import service.ExamScheduleServiceImpl;
import service.FreeBoardService;
import service.FreeBoardServiceImpl;
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
		HttpSession session = request.getSession();
		Integer num = Integer.parseInt(request.getParameter("num"));
		Member member = (Member)session.getAttribute("member");
		List<ExamInfo> examInfoList = null;
		List<ExamSchedule> examScheduleList = null;
		
		try {
			TestBoardService testboardService = new TestBoardServiceImpl();
			TestBoard testboard = testboardService.TestBoardDetail(num);
			
			ExamInfoService examinfoservice = new ExamInfoServiceImpl();
			
			examInfoList = examinfoservice.getExamInfoNames();
			ExamScheduleService examscheduleservice = new ExamScheduleServiceImpl();
			
			examScheduleList = examscheduleservice.getExamScheduleRounds();
			
			
			if (testboard.getWriter().equals(member.getId())) {
				request.setAttribute("member", member);
				request.setAttribute("examInfoList", examInfoList); // JSP 페이지로 데이터 전달
				request.setAttribute("examScheduleList", examScheduleList);
				request.setAttribute("testboard", testboard);
				request.getRequestDispatcher("testboardmodify.jsp").forward(request, response);
			}
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
			response.sendRedirect("testboarddetail?num="+num);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "게시글 수정 오류");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
}