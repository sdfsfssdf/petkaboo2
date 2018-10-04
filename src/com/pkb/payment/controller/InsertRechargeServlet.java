package com.pkb.payment.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pkb.member.model.vo.User;
import com.pkb.payment.model.service.PaymentService;
import com.pkb.payment.model.vo.CyberMoney;
import com.pkb.payment.model.vo.Payment;

/**
 * Servlet implementation class InsertRechargeServlet
 */
@WebServlet("/insertRecharge.rc")
public class InsertRechargeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertRechargeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String check_ok = request.getParameter("check");
		int check = 0;
		
		HttpSession session = request.getSession();
		int user_no = ((User)(session.getAttribute("loginUser"))).getUser_no();	//회원번호
		String paid_amount = request.getParameter("paid_amount");				//충전금액
		int pay_amount = Integer.parseInt(paid_amount);
		String imp_uid = request.getParameter("imp_uid");						//아임포트 고유번호
		String pay_type= request.getParameter("pay_type");						//결제구분 (카드 0, 현금 1)
		int payment_type = 0;
		if(pay_type == "card"){
			payment_type = 0;
		}
		String apply_no = request.getParameter("apply_num"); //카드 승인번호
		
		if(check_ok != null){
			check = Integer.parseInt(request.getParameter("check"));
		}
		
		
		/*int contract_no = Integer.parseInt(request.getParameter("contract_no"));*/
			
		System.out.println("들어옴");
		System.out.println(user_no+"/// 유저");
		System.out.println(paid_amount+"/// 돈");
		System.out.println(imp_uid + "아임포트 고유번호 들어옴");
		System.out.println(payment_type + "결제수단 왔어");
		System.out.println(apply_no + "카드승인번호 들어왔다");

		
		Payment py = new Payment();
		
		py.setUser_no(user_no);					//회원번호
		py.setPay_amount(pay_amount);			//충전금액
		py.setPayment_type(payment_type);		//결제구분
		py.setCard_apply_no(apply_no);			//카드승인 번호
		py.setImp_uid(imp_uid);					//아임포트 고유번호
		
		System.out.println("py객체 들어왔어? : " + py);
		
		int result = new PaymentService().insertRecharge(py, user_no);
		
		String page = "";
		
		if(result > 0){
			
			CyberMoney cm = new PaymentService().searchCyberMoney(user_no);
			
			if(cm != null){
				/*String check2 = "check";
				page = "views/myPage/mypagemain.jsp";*/
				request.setAttribute("cm", cm);
				response.sendRedirect("/pkb/views/status/rechargeOk.jsp");
				/*request.setAttribute("check", check2);*/
			}else{
				page="views/common/errorPage";
				request.setAttribute("msg", "충전 실패");
			}
			
			
			//보유한 금액이 증가한 후에 액션을 어떻게.. alert창 띄운 후에 select?겠지?? 
		/*	
			request.setAttribute("py", py);
			page = "views/status/requestPayment.jsp";*/
			
			/*String check ="Y";*/
			//check=" + check + 
			
			//response.sendRedirect(request.getContextPath() + "/selectRecPay.rp?user_no=" + user_no);
			
			/*
			PrintWriter out = response.getWriter();

			out.println("<script>");

			out.println("alert('충전이 완료되었습니다'); location.href='/selectRecPay.rp?check=0';");


			out.println("</script>");*/
	
			//response.sendRedirect(request.getContextPath()+ "/selectRecharge.rc");
				
		}else{
			request.setAttribute("msg", "충전 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
