package com.exam.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.dao.QuestionMcqDao;
import com.exam.dao.ResultDao;
import com.exam.dao.SubjectDao;
import com.exam.entity.QuestionsMcq;
import com.exam.entity.Result;
import com.exam.entity.User;
import com.exam.helper.ConnectionProvider;

/**
 * Servlet implementation class AnswerMcqServlet
 */
@WebServlet("/AnswerMcqServlet")
public class AnswerMcqServlet extends HttpServlet {
	static int count = 1;
	static int totleAns = 0;

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AnswerMcqServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");

		
		
		//int id = (int) session.getAttribute("selSubId");
		SubjectDao sd = new SubjectDao(ConnectionProvider.getConnection());
		String sname = request.getParameter("subjectId");
		int eid = Integer.parseInt(request.getParameter("examid"));
//		int count1 = Integer.parseInt(request.getParameter("count1"));
		String fdate = request.getParameter("fdate");
		

		
		System.out.println("\nThe value of real sub is : "+sname);
		String ans = request.getParameter("QuesOption");
		String organs = request.getParameter("organs");
	 	
		if (ans.equals(organs)) {
			totleAns++;
		}
		System.out.println("answer is : "+totleAns+" Original Answer is : "+organs+" with my answer is : "+ans);

		QuestionMcqDao s = new QuestionMcqDao(ConnectionProvider.getConnection());
		
		
		ArrayList<QuestionsMcq> sub = s.getAllExamQueById(eid);
		if (sub.size() > count) {
			count++;
			System.out.println("We added.......with ans" + totleAns);//examOmr.jsp?count=1&&subnm=sname%>&&examid=<%=examdata.getEdtid()%>
			response.sendRedirect("examOmr.jsp?count=" + count+"&&subnm="+sname+"&&examid="+eid+"&&fdate="+fdate);
		} else {
			Result result = new Result();
			result.setAns(totleAns);
			result.setTotque(sub.size());
			result.setStdId(user.getId());
			result.setSubNm(sname);
			
			ResultDao rd = new ResultDao(ConnectionProvider.getConnection());
			rd.insertResult(result);
				
			count=0;
			
			
			response.sendRedirect("index.jsp");
			

		}

		doGet(request, response);
	}

}
