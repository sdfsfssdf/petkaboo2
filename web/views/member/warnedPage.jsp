<%@page import="com.pkb.member.model.service.UserService"%>
<%@page import="com.pkb.member.util.SHA256"%>
<%@page import="com.pkb.member.model.dao.UserDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("UTF-8");


		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('제재된 회원입니다.');");

		script.println("location.href = '../../index.jsp'");

		script.println("</script>");

		script.close();		
	

%>