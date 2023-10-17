package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Member;
import service.FreeBoardService;
import service.FreeBoardServiceImpl;

/**
 * Servlet implementation class FreeBoardDelete
 */
@WebServlet("/freeboarddelete")
public class FreeBoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer num = Integer.parseInt(request.getParameter("num"));
		String writer = request.getParameter("writer");
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		try {
			if (writer.equals(member.getId())) {
				FreeBoardService freeboardService = new FreeBoardServiceImpl();
				freeboardService.freeBoardDelete(num);
				response.sendRedirect("freeboard");
			}
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "게시글 삭제 오류");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
		
	}

}
