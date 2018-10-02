package com.pkb.member.controller;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pkb.member.model.service.UserService;
import com.pkb.member.model.vo.User;


@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("email");
		String user_pwd = request.getParameter("user_pwd");
		String ip = request.getParameter("ip");
		System.out.println("아이피 들어옴>?" + ip);
		User loginUser = null;
		HttpURLConnection urlcon = (HttpURLConnection)new URL("http://ip2c.org/"+ip).openConnection();
		urlcon.setDefaultUseCaches(false);
		urlcon.setUseCaches(false);
		urlcon.connect();
		InputStream is = urlcon.getInputStream();
		int c = 0;
		String s = "";
		int result=0;
		while((c = is.read()) != -1) s+= (char)c;
		is.close();
		switch(s.charAt(0))
		{
		  case '0':
		    System.out.println("Something wrong");
		    break;
		  case '1':
		    String[] reply = s.split(";");
		    System.out.println("Three-letter: " + reply[2]);
		    loginUser = new UserService().loginCheck(email, user_pwd,ip,reply[2]);
		    System.out.println("로그인 히스토리 :"+result);
			break;
		  case '2':
		    System.out.println("Not found in database");
		    break;
		}
		
		
		System.out.println("controller : " + loginUser);
		
		if(loginUser != null){
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			if(loginUser.getUser_type()==9){
				response.sendRedirect("views/admin/main/adminMain.jsp");
			}else{
				if(loginUser.getUser_status()==4){
					request.getSession().invalidate();
					response.sendRedirect("views/member/warnedPage.jsp");	
				}
				else if(loginUser.getUser_status()==2){
					request.getSession().invalidate();
					response.sendRedirect("views/member/leaveMemberPage.jsp");
				}else if(loginUser.getUser_status()==1){
					response.sendRedirect("index.jsp");
				}
			}
		}else{
			request.setAttribute("msg", "로그인 실패!");
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




