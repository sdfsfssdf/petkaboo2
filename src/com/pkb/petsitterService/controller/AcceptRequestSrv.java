package com.pkb.petsitterService.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.petsitterService.model.service.ContractMainService;

/**
 * Servlet implementation class AcceptRequestSrv
 */
@WebServlet("/acceptReq.do")
public class AcceptRequestSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AcceptRequestSrv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 테스트 코드
		System.out.println("acceptReq는: " + request.getParameter("acceptReq"));
		System.out.println("pst_user_no는: " + request.getParameter("pst_user_no"));
		System.out.println("psrno는: " + request.getParameter("psrno"));
		System.out.println("client_user_no는: " + request.getParameter("client_user_no"));
		System.out.println("contractNo는: " + request.getParameter("contractNo"));
		String acceptReq = null;
		int result = 0;
		int client_user_no = Integer.parseInt(request.getParameter("client_user_no"));
		int contractno = Integer.parseInt(request.getParameter("contractNo"));
		int ps_userno = Integer.parseInt(request.getParameter("pst_user_no"));
		
		if(request.getParameter("acceptReq") != null && request.getParameter("acceptReq").equals("수락")){
			acceptReq = "E";
			result = new ContractMainService().acceptReq(contractno, client_user_no, acceptReq);				
		} else {
			acceptReq = "C";
			result = new ContractMainService().refuseReq(contractno, client_user_no, acceptReq);
		}
		
		// 성공처리
		if(result > 0){
			request.setAttribute("user_no", ps_userno);
			request.getRequestDispatcher("/psContract.do").forward(request, response);
		}else{
			request.setAttribute("msg", "펫시터 서비스 계약 수락 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
