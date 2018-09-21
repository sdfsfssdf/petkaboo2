<%@page import="com.pkb.member.model.service.UserService"%>
<%@page import="com.pkb.member.util.SHA256"%>
<%@page import="com.pkb.member.model.dao.UserDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("UTF-8");

	UserDAO userDAO = new UserDAO();

	if(session.getAttribute("loginUser") != null) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('관리자 확인후 인증이 완료됩니다.');");

		script.println("location.href = '../myPage/modifyMemberInfoMain.jsp'");

		script.println("</script>");

		script.close();		
	
		return;
	}
%>