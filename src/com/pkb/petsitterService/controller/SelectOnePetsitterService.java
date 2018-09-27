package com.pkb.petsitterService.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		int psrno = Integer.parseInt(request.getParameter("no"));
		String revLevel_ori = request.getParameter("revLevel");
		String page = null;
		int revLevel = 0;
		
		if(revLevel_ori != null){
			revLevel = Integer.parseInt(request.getParameter("revLevel"));
		}
		
		PetsitterService p = new PetsitterMainService().selectOne(psrno);
		
		if(p != null){
			
			if(revLevel == 0){
			// 테스트 코드
			System.out.println("예약단계 없음");
				
			page ="views/searchPetsitter/searchPetsitterDetail.jsp";
			request.setAttribute("p", p);
			
			}else if(revLevel == 1){
			
			page ="views/searchPetsitter/petSittingRsvApply.jsp";	
			request.setAttribute("p", p);		
			
			}
			
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
