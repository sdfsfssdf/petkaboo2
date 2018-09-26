package com.pkb.petsitterService.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.petsitterService.model.service.PetsitterMainService;
import com.pkb.petsitterService.model.vo.PetsitterService;

/**
 * Servlet implementation class SelectOnePetsitterService
 */
@WebServlet("/selectOne.do")
public class SelectOnePetsitterService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOnePetsitterService() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PetsitterService p = null;
		// 펫시터 서비스 등록번호가 있다면
		int psrno = Integer.parseInt(request.getParameter("no"));
		
		// user_no는 일부러 스트링으로 꺼내기
		String user_no = request.getParameter("user_no");
		
		if(psrno != 0){
			// 전달 받은 psrno가 있다면
			// 테스트코드
			System.out.println(psrno);
			
			p = new PetsitterMainService().selectOne(psrno);
			
		}else if(user_no != null){
			// 전달 받은 user_no가 있다면
			// 테스트코드
			System.out.println(user_no);
			
			p = new PetsitterMainService().selectOne(user_no);
			
		}else{
			System.out.println("조회실패");
		}
		
		String page = null;
		
		if(p != null){
			page ="views/searchPetsitter/searchPetsitterDetail.jsp";
			request.setAttribute("p", p);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "펫시터 상세 정보 조회 실패");
		}
		
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
