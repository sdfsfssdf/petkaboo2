<%@page import="com.pkb.member.model.service.UserService"%>
<%@page import="com.pkb.member.util.SHA256"%>
<%@page import="com.pkb.member.model.dao.UserDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("UTF-8");

	String code = request.getParameter("code");

	UserDAO userDAO = new UserDAO();

	String email = null;

	if(session.getAttribute("email") != null) {

		email = (String)session.getAttribute("email");

	}

	if(email == null) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('로그인을 해주세요.');");

		script.println("location.href = 'views/common/login.jsp'");

		script.println("</script>");

		script.close();

		return;
	}
%>
<%
	boolean rightCode = (new SHA256().getSHA256(email).equals(code)) ? true : false;

	if(rightCode == true) {
		
		int result = new UserService().mailAuth(email,code);
	
		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('인증에 성공했습니다.');");

		script.println("location.href = '../../index.jsp'");

		script.println("</script>");

		script.close();		
	
		return;
	} else {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('유효하지 않은 코드입니다.');");

		script.println("location.href = 'index.jsp'");

		script.println("</script>");

		script.close();		

		return;
 	}%>