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
import dto.Member;
import dto.TestBoard;
import service.ExamInfoService;
import service.ExamInfoServiceImpl;
import service.ExamScheduleService;
import service.ExamScheduleServiceImpl;
import service.TestBoardService;
import service.TestBoardServiceImpl;

/**
 * Servlet implementation class TestBoardWrite
 */
@WebServlet("/testboardwrite")
public class TestBoardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestBoardWrite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		// 서블릿에서 examinfo 데이터를 가져오는 코드 (예시)
		List<ExamInfo> examInfoList = null;
		try {
			ExamInfoService examinfoservice = new ExamInfoServiceImpl();
			examInfoList = examinfoservice.getExamInfoNames();
			request.setAttribute("examInfoList", examInfoList); // JSP 페이지로 데이터 전달
			if(session.getAttribute("member")==null) {
				request.getRequestDispatcher("login.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("testboardwrite.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} // examInfoDao는 examinfo 테이블과 상호작용하는 DAO 객체
		
		// 서블릿에서 examschedule 데이터를 가져오는 코드 (예시)
		List<ExamSchedule> examScheduleList = null;
		try {
			ExamScheduleService examscheduleservice = new ExamScheduleServiceImpl();
			examScheduleList = examscheduleservice.getExamScheduleRounds();
			request.setAttribute("examScheduleList", examScheduleList);
			if(session.getAttribute("member")==null) {
				request.getRequestDispatcher("login.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("testboardwrite.jsp").forward(request, response);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String uploadPath = request.getServletContext().getRealPath("upload");
		int size = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8",
				new DefaultFileRenamePolicy());
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		String subject = multi.getParameter("subject");
		String round = multi.getParameter("round");
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String fileUrl = multi.getOriginalFileName("file");
		
		TestBoard testboard = new TestBoard();
		testboard.setSubject(subject);
		testboard.setRound(round);
		testboard.setTitle(title);
		testboard.setContent(content);
		testboard.setFileurl(fileUrl);
		testboard.setWriter(member.getId());
		
		try {
			TestBoardService testboardService = new TestBoardServiceImpl();
			testboardService.TestBoardWrite(testboard);
			response.sendRedirect("testboard");
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}
