package com.pkb.petsitterService.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.petsitterService.model.service.ContractMainService;
import com.pkb.reservation.model.vo.Contract;

/**
 * Servlet implementation class RequestPetService
 */
@WebServlet("/requestPetService.do")
public class RequestPetService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestPetService() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 넘겨받은 값을 세팅할 Contract c 객체 생성
		Contract c = new Contract();
		
		// 기존 계약이 있는지 검색
		c = new ContractMainService().selectOne(Integer.parseInt(request.getParameter("psrno")), Integer.parseInt(request.getParameter("clientUserno")));
		
		System.out.println("조회한 c는: " + c);
		// 해당 서비스에 대한 기존 계약이 없다면
		if(c == null){
		// c 객체에 값 세팅
		c = new Contract();
		c.setUser_no(Integer.parseInt(request.getParameter("clientUserno")));
		c.setPet_user_no(Integer.parseInt(request.getParameter("psUserno")));
		c.setPet_no(Integer.parseInt(request.getParameter("request_count")));
		c.setPet_service_regno(Integer.parseInt(request.getParameter("psrno")));
		c.setContract_start(Date.valueOf(request.getParameter("request_start")));
		c.setContract_end(Date.valueOf(request.getParameter("request_end")));
		
		// 테스트 코드
		System.out.println("값을 세팅한 c는:" + c);
		
		// 서비스에 c 객체를 넘겨서 삽입
		int result = new ContractMainService().insertContract(c);

		// 넘겨줄 페이지 초기화
		String page = "";
		
		// 삽입에 성공했으면 해당 계약을 조회해서 객체로 넘기기
		if(result > 0){
			
			// userno와 psrno로 조회
			c = new ContractMainService().selectOne(Integer.parseInt(request.getParameter("psrno")), Integer.parseInt(request.getParameter("clientUserno")));
			System.out.println("삽입직후 가져온 c는: " + c);
			page = "views/searchPetsitter/petSittingApplyProcess.jsp";
			request.setAttribute("afterApply", "y");
			request.setAttribute("c", c);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "펫시터 서비스 계약 요청 실패");
		}

		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		} else {
			String page = "views/searchPetsitter/petSittingApplyProcess.jsp";
			request.setAttribute("c", c);
			request.setAttribute("errorCode", "alreadyExist");
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
