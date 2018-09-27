package com.pkb.reservation.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		String page = null;
		
		if(p != null){
			
			if(revLevel == 0){
			// 테스트 코드
			System.out.println("예약 단계 없음");
				
			page ="views/searchPetsitter/searchPetsitterDetail.jsp";
			request.setAttribute("p", p);
			
			}else if(revLevel == 1){
			
			page ="views/searchPetsitter/petSittingRsvApply.jsp";	
			request.setAttribute("p", p);		
			
			}else if(revLevel == 2){
				//입력한 계약 타입
				
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
				
				//로그인 유저 세션
				HttpSession session = request.getSession();
				User loginUser = (User)session.getAttribute("loginUser");
				String user_no = String.valueOf(loginUser.getUser_no());
				
				
				
				System.out.println(totalAddress);
				System.out.println(contract_start);
				System.out.println(contract_end);
				System.out.println(totalPhone);
				
				Contract c = new Contract();
				
				
				c.setAddress(totalAddress);
				c.setContract_start(contract_start);
				c.setContract_end(contract_end);
				c.setPhone(totalPhone);
				c.setUser_no(Integer.parseInt(user_no));
				
				System.out.println("c객체 잘담았나 : " + c);
				
				int result = new ContractService().insertContractPetsitting(c, p);
				
			
				if(result > 0){
					/*response.sendRedirect(request.getContextPath() + "/selectCtrPetsitting.ct");*/
					
					System.out.println("c객체 잘 잇어? : " + c);
					Contract c2 = new ContractService().selectContractPetsitting(c);
					
					
				}else{
					request.setAttribute("msg", "예약 실패");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				}
			
			}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "펫시터 상세 정보 조회 실패");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}
		
}	
		
		//불러올 펫시터 정보
		/*String petUser_name = request.getParameter("petUser_name");
		String petUser_address = request.getParameter("petUser_address");*/
		
		
		
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
