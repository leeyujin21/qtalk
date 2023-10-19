package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Member;
import service.OneLineBoardService;
import service.OneLineBoardServiceImpl;

/**
 * Servlet implementation class OneLineBoardDelete
 */
@WebServlet("/onelineboarddelete")
public class OneLineBoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OneLineBoardDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		if(member == null) {
			System.out.println("onelineboarddelete login error");
			request.getRequestDispatcher("onelineboardpost").forward(request, response);
		}
		
		String typeBoard = request.getParameter("typeBoard");
		String num = request.getParameter("num");
		try {
			if(typeBoard == null) {
				OneLineBoardService oneLineBoardService = new OneLineBoardServiceImpl();
				oneLineBoardService.oneLineBoardDelete(num);
				request.getRequestDispatcher("onelineboardpost").forward(request, response);
			} else {
				OneLineBoardService oneLineBoardService = new OneLineBoardServiceImpl();
				oneLineBoardService.oneLineBoardDelete(num);
				request.setAttribute("typeBoard", typeBoard);
				request.getRequestDispatcher("mywriteboard").forward(request, response);
			}
		} catch(Exception e) {
			request.getRequestDispatcher("onelineboardpost").forward(request, response);
		}
	}

}
