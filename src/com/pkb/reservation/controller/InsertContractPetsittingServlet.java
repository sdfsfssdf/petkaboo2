package com.pkb.reservation.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.View;

import com.pkb.member.model.vo.User;
import com.pkb.petsitterService.model.service.PetsitterMainService;
import com.pkb.petsitterService.model.vo.PetsitterService;
import com.pkb.reservation.model.service.ContractService;
import com.pkb.reservation.model.vo.Contract;

/**
 * Servlet implementation class InsertContractPesittingServlet
 */
@WebServlet("/insertCtr.ct")
public class InsertContractPetsittingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertContractPetsittingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int servno = Integer.parseInt(request.getParameter("no"));
		String revLevel_come = request.getParameter("revLevel");
		int revLevel = 0;
		
		if(revLevel_come != null){
			revLevel = Integer.parseInt(request.getParameter("revLevel"));
		}
		
		PetsitterService p = new PetsitterMainService().selectOne(servno);
		
		// 테스트코드
		System.out.println("revLevel" + revLevel);
		
		String page = "";
	
		if(p != null){
			
			if(revLevel == 0){
			// 테스트 코드
			System.out.println("예약 단계 없음");
				
			page ="views/searchPetsitter/searchPetsitterDetail.jsp";
			request.setAttribute("p", p);
			
			}else if(revLevel == 1){
			
			//page ="views/searchPetsitter/petSittingRsvApply.jsp";
			page = "views/status/contractProcess.jsp";
			request.setAttribute("p", p);		
			
			}else if(revLevel == 2){ //예약!
				//입력한 계약 타입
				System.out.println("예약 들어감");
				//입력한 주소
				String zipNo = request.getParameter("zipNo");
				String address1 = request.getParameter("useraddress1");
				String address2 = request.getParameter("useraddress2");
				String totalAddress = zipNo + "@" + address1 + "@" + address2;
				System.out.println(totalAddress);
				
				//입력한 예약날짜
				String startdate = request.getParameter("startdate");
				Date contract_start = Date.valueOf(startdate);
				String enddate = request.getParameter("enddate");
				Date contract_end = Date.valueOf(enddate);
				
				//입력한 휴대폰 번호
				String phone1 = request.getParameter("phoneNum1");
				String phone2 = request.getParameter("phoneNum2");
				String totalPhone = phone1 + "-" + phone2;
				System.out.println(totalPhone);
				
				//로그인 유저 세션
				HttpSession session = request.getSession();
				User loginUser = (User)session.getAttribute("loginUser");
				String user_no2 = String.valueOf(loginUser.getUser_no());
				int user_no = 0;
				user_no = Integer.parseInt(user_no2);
				
				Contract c = new Contract();
				
				c.setUser_no(user_no);
				c.setPet_service_regno(servno);
				c.setContract_start(contract_start);
				c.setContract_end(contract_end);
				c.setUserPhone(totalPhone);
				c.setUserAddress(totalAddress);
				System.out.println("c객체 잘 잇어? : " + c);
				
				int result = new ContractService().insertContractPetsitting(c);
					
				System.out.println("여기 왔다");
				
				
				if(result > 0){	
					
					Contract c2 = new ContractService().searchContractPetsitting(user_no, servno);
					
					if(c2 != null){
						page = "views/status/contractProcess.jsp";
						request.setAttribute("c", c2);
						
					}else{
						page= "views/common/errorPage.jsp";
						request.setAttribute("msg", "예약 조회실패");
					
					}
					
			
				}else{
					page= "views/common/errorPage.jsp";
					request.setAttribute("msg", "예약 실패");
		
										
					
				}
				
				  RequestDispatcher view = request.getRequestDispatcher(page);
	               view.forward(request, response);
				
		
			}
			
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
