package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ExamSchedule;
import dto.Level;
import service.ExamScheduleService;
import service.ExamScheduleServiceImpl;
import service.OneLineBoardService;
import service.OneLineBoardServiceImpl;

/**
 * Servlet implementation class Main
 */
@WebServlet("/main")
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Main() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      request.setCharacterEncoding("utf-8");
	      
	      try {
	         ExamScheduleService examScheduleService = new ExamScheduleServiceImpl();
	         List<ExamSchedule> scheduleList = examScheduleService.scheduleList();
	         
	         // main left box
	         if(scheduleList.size() == 0) { // 시험 일정 없음
	        	 request.setAttribute("title", "접수 가능 시험없음");
	         } else { // 시험 일정 있음
	        	 request.setAttribute("title", scheduleList.get(0).getImplplannm());
	        	 if(scheduleList.get(0).getDocregstartdt() == null) {
	        		 // 실기
	        		 request.setAttribute("type", "실기 시험 접수 기간");
	        		 String str = scheduleList.get(0).getPracregstartdt() +" ~ "+scheduleList.get(0).getPracregenddt();
	        		 request.setAttribute("schedule", str);
	        	 } else {
	        		 // 필기
	        		 request.setAttribute("type", "필기 시험 접수 기간");
	        		 String str = scheduleList.get(0).getDocregstartdt() + " ~ " +scheduleList.get(0).getDocregenddt();
	        		 request.setAttribute("schedule", str);
	        	 }
	         }
	         
	         // main right box (subject, cnt, tot)
	         OneLineBoardService oneLineBoardService = new OneLineBoardServiceImpl();
	         List<Level> mostSub = oneLineBoardService.oneLineBoardMostSubject();
	         for(int i = 0; i < mostSub.size(); i++) {
	        	 String temp = Math.round( mostSub.get(i).getTot() / mostSub.get(i).getCnt()) + "";
	        	 mostSub.get(i).setLevel(temp);
	         }
	         
	         // main right box 확률 추가
	         
	         request.setAttribute("subjects", mostSub);
	         request.getRequestDispatcher("main.jsp").forward(request, response);
	         
	      } catch(Exception e) {
	         e.printStackTrace();
	         request.getRequestDispatcher("main.jsp").forward(request, response);
	      }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	 protected void doPost(HttpServletRequest request, HttpServletResponse
	 response) throws ServletException, IOException { doGet(request, response); }
	

}
