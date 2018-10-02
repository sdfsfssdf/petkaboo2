package com.pkb.petsitterService.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pkb.petsitterService.model.service.ContractMainService;
import com.pkb.reservation.model.vo.Contract;

/**
 * Servlet implementation class ManageMyContract
 */
@WebServlet("/psContract.do")
public class ManageMyContract extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageMyContract() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int user_no = 0;
		int request_client_list = 0;
		ArrayList<Contract> cList = null;
		
		if(request.getAttribute("user_no") == null){
			// System.out.println("getAttribute는 null");
			user_no = Integer.parseInt(request.getParameter("user_no"));
		}else{
			// System.out.println("getAttribute가 있다");
			user_no = Integer.parseInt(request.getAttribute("user_no").toString());
		}
		
		if(request.getParameter("request_client_list") == null){
			System.out.println("넘겨 받은 값 중에서 request_client_list가 없다");
		}else{
			System.out.println("넘겨 받은 값 중에서 request_client_list가 있다");
			request_client_list = Integer.parseInt(request.getParameter("request_client_list"));
		}
		
		// 테스트 코드		
		System.out.println("request_client_list는? " + request_client_list);
					
		String page = "";
		if(request_client_list != 1)
		{
			cList = new ContractMainService().selectList(user_no);
		} else {
			cList = new ContractMainService().selectMyList(user_no);
		}
		
		if(cList != null){
			
			if(request_client_list != 1){
				page = "views/myPage/petSitterContractManage.jsp";
				request.setAttribute("cList", cList);
			} else {
				page = "views/myPage/myReserveList.jsp";
				request.setAttribute("cList", cList);
			}
			
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "조회 실패!");
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
