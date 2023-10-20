package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Member;
import service.MemberService;
import service.MemberServiceImpl;

/**
 * Servlet implementation class ChangeInfo
 */
@WebServlet("/changeinfo")
public class ChangeInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeInfo() {
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
		
		// 로그인 여부 확인
		if(member==null) {
			request.setAttribute("err", "로그인 되지 않았습니다.");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("changeinfo.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		// 로그인 여부 확인
		if(member==null) {
			request.setAttribute("err", "로그인 되지 않았습니다.");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		// 현재 비밀번호
		String password = request.getParameter("password");
		// 변경할 닉네임
		String nickname = request.getParameter("nickname");
		// 변경 할 비밀번호
		String newPassword = request.getParameter("password1");
		
		if((member.getPassword()).equals(password)) {
			System.out.println("현재 비밀번호와 새 비밀번호가 일치합니다.");
			String err = "현재 비밀번호가 일치하지 않습니다.";
			request.setAttribute("err", err);
			request.getRequestDispatcher("changeinfo.jsp").forward(request, response);
		} else if(!(newPassword == null)) {
			member.setNickname(nickname);
			member.setPassword(newPassword);
		} else {
			member.setNickname(nickname);
		}

		try {
			MemberService memberService = new MemberServiceImpl();
			memberService.memberchange(member);
			session.setAttribute("member", member);
			request.getRequestDispatcher("mypage.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("changeinfo.jsp").forward(request, response);
		}
	}

}
