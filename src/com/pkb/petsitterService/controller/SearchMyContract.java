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
import com.pkb.reservation.model.vo.Contract;

/**
 * Servlet implementation class SearchMyContract
 */
@WebServlet("/searchMyContract.do")
public class SearchMyContract extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchMyContract() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 테스트 코드
		System.out.println(request.getParameter("contractno"));
		System.out.println(request.getParameter("petsitterno"));
		
		int psrno = Integer.parseInt(request.getParameter("contractno"));
		int petsitterno = Integer.parseInt(request.getParameter("petsitterno"));
		String page = null;
		
		PetsitterService p = new PetsitterMainService().selectOne(psrno);
		Contract c = null;
		
		// 조회된 펫시터 서비스가 있다면
		if(p != null){
			c = new PetsitterMainService().selectOneContract(psrno, petsitterno);
			page ="views/searchPetsitter/petSittingRsvApply.jsp";	
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
