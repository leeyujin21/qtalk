package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Member;
import service.MemberDeleteService;
import service.MemberDeleteServiceImpl;

/**
 * Servlet implementation class DeleteMember
 */
@WebServlet("/deletemember")
public class DeleteMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMember() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("deletemember.jsp").forward(request, response);
	}
		
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		HttpSession session = request.getSession();
		Member smember = (Member)session.getAttribute("member");
		try {
			if(!(smember.getPassword().equals(password))) {
				request.setAttribute("err", "비밀번호 오류");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
			
			MemberDeleteService memberDeleteService = new MemberDeleteServiceImpl();
			memberDeleteService.deleteAll(id);
			session.removeAttribute("member");
			response.sendRedirect("main");
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "회원탈퇴 오류");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
	}

}
