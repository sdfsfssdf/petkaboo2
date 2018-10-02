package com.pkb.petsitterService.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.member.model.vo.CyberMoney;
import com.pkb.petsitterService.model.service.ContractMainService;
import com.pkb.reservation.model.vo.Contract;

/**
 * Servlet implementation class PaymentRequest
 */
@WebServlet("/paymentReq.do")
public class PaymentRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentRequest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pst_user_no = request.getParameter("pst_user_no");
		int psrno = Integer.parseInt(request.getParameter("psrno"));
		int user_no = Integer.parseInt(request.getParameter("user_no"));
		String contractno = request.getParameter("contractNo");
		String page = "";
		
		Contract c = new Contract();
		CyberMoney cMoney = null;
		
		c = new ContractMainService().selectOne(psrno, user_no);
		
		if(c != null && c.getService_status() != null && c.getService_status().equals("W")){
			// 검색 결과 값이 있고 service_status 값이 W라면 사이버머니 조회해 오기
			cMoney = new ContractMainService().checkCMoney(user_no);
			
			if(cMoney != null){
				// 그래서 조회한 사이버머니 테이블이 있다면 서비스 가격 계산
				System.out.println("사이버머니 조회 성공 " + cMoney);
				
				page = "views/myPage/paymentProceed.jsp";
				request.setAttribute("c", c);
				request.setAttribute("cMoney", cMoney);	
				
			} else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "결제 실패!");		
			}
			
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "결제 실패!");		
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
