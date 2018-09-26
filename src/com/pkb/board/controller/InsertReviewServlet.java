package com.pkb.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.member.model.service.UserService;
import com.pkb.member.model.vo.User;
import com.pkb.reservation.model.vo.Reservation;

/**
 * Servlet implementation class InsertReviewServlet
 */
@WebServlet("/insertReview.bo")
public class InsertReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("리뷰작성하기버튼 누르고 왔다!");
		
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		ArrayList<Reservation> rsvList = new UserService().getReservation(loginUser);
		
		String page = "";
		page="views/myPage/reviewList.jsp";
		
		String petsitterName = request.getParameter("petsitterName");
		String petName = request.getParameter("petName");
		String contractNo = request.getParameter("contractNo");
		String onetitle = request.getParameter("onetitle");
		String onecontent = request.getParameter("onecontent");
		String writtedDate = request.getParameter("writtedDate");
		
		request.setAttribute("onetitle", request.getParameter("onetitle"));
		request.setAttribute("onecontent", request.getParameter("onecontent"));
		request.setAttribute("petsitterName", request.getParameter("petsitterName"));
		request.setAttribute("petName", request.getParameter("petName"));
		request.setAttribute("contractNo", request.getParameter("contractNo"));
		request.setAttribute("writtedDate", request.getParameter("writtedDate"));
		
		System.out.println(petsitterName);
		System.out.println(petName);
		System.out.println(contractNo);
		System.out.println(onetitle);
		System.out.println(onecontent);
		System.out.println(writtedDate);
		
		
		/*request.setAttribute("writter", request.getParameter("writter"));
		
		System.out.println(writter);*/
		
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
