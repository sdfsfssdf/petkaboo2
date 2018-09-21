package com.pkb.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pkb.member.model.service.UserService;
import com.pkb.member.model.vo.User;

/**
 * Servlet implementation class ModifyAddressServlet
 */
@WebServlet("/modifyAdd.ma")
public class ModifyAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyAddressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String add1 = request.getParameter("address");
		String add2 = request.getParameter("addressDetail");
		String postcode = request.getParameter("postcode");
		String email = (String)request.getSession().getAttribute("email");
		String address = (add1+add2+'/'+postcode);
		User loginUser = (User)request.getSession().getAttribute("loginUser");

		System.out.println(address);
		
		
		int result = new UserService().changeAdd(loginUser, address);
		System.out.println(result);
		String page="";
		if(result>0){
			HttpSession session = request.getSession();
			User u = (User)session.getAttribute("loginUser");
			u.setAddress(address);
			// 키값은 중복이 안된다. 
			session.setAttribute("loginUser", u);
			response.sendRedirect("views/myPage/modifyMemberInfoMain.jsp");
		}else{
			request.setAttribute("msg", "주소 변환실패!");
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
