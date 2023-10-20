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
import dto.Member;
import dto.OneLineBoard;
import dto.TestBoard;
import service.FreeBoardService;
import service.FreeBoardServiceImpl;
import service.OneLineBoardService;
import service.OneLineBoardServiceImpl;
import service.TestBoardService;
import service.TestBoardServiceImpl;

/**
 * Servlet implementation class MyOneLineBoard
 */
@WebServlet("/mywriteboard")
public class MyWriteBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyWriteBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// login 상태 확인
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		if(member == null) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		// x 값으로 board 종류 구분 
		// typeBoard = 1 (freeboard)
		// typeBoard = 2 (testboard)
		// typeBoard = 3 (onelineboard)
		String typeBoard = request.getParameter("typeBoard");
		if(typeBoard.equals("1")) { // freeboard
			try {
				FreeBoardService freeBoardService = new FreeBoardServiceImpl();
				List<FreeBoard> freeBoardList = freeBoardService.myWriteFreeBoard(member.getId());
				request.setAttribute("typeBoard", typeBoard);
				request.setAttribute("freeBoardList", freeBoardList);
				request.getRequestDispatcher("mypage.jsp").forward(request, response);
				
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("freeBoardList 불러오기 실패");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		} else if(typeBoard.equals("2")) { // testboard
			try {
				TestBoardService testBoardService = new TestBoardServiceImpl();
				List<TestBoard> testBoardList = testBoardService.myWriteTestBoard(member.getId());
				request.setAttribute("typeBoard", typeBoard);
				request.setAttribute("testBoardList", testBoardList);
				request.getRequestDispatcher("mypage.jsp").forward(request, response);
				
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("testBoardList 불러오기 실패");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		} else if(typeBoard.equals("3")) { // onelineboard
			try {
				OneLineBoardService oneLineBoardService = new OneLineBoardServiceImpl();
				List<OneLineBoard> oneLineBoardList = oneLineBoardService.myWriteOneLineBoard(member.getId());
				request.setAttribute("typeBoard", typeBoard);
				request.setAttribute("oneLineBoardList", oneLineBoardList);
				request.getRequestDispatcher("mypage.jsp").forward(request, response);
				
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("onelineBoardList 불러오기 실패");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		} else {
			System.out.println("서버 오류");
			request.setAttribute("err", "내가 쓴 글 불러오기 실패");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
}
