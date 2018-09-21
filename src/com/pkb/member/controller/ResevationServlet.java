package com.pkb.member.controller;

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
 * Servlet implementation class ResevationServlet
 */
@WebServlet("/reservation.ps")
public class ResevationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResevationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		
		ArrayList<Reservation> rsvList = new UserService().getReservation(loginUser);
		
		String page="";
		page="views/myPage/reserveList.jsp";
		request.setAttribute("rsvList", rsvList);
//		request.setAttribute("pg", pg);//페이징처리에 쓸거임
		System.out.println("sss" + loginUser);
		
		System.out.println("rsvList = " + rsvList );
	RequestDispatcher view = request.getRequestDispatcher(page);
	view.forward(request, response);
	//방법 = 스트링,모델엔뷰,디스페처
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
