<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.PrintWriter, com.pkb.payment.model.vo.*"%>
    <% 
  	 CyberMoney cm = (CyberMoney)request.getAttribute("cm");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%

	request.setCharacterEncoding("UTF-8");


		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('충전이 완료되었습니다.');");

		request.setAttribute("cm", cm); 
		script.println("location.href = '/pkb/views/myPage/mypagemain.jsp'");

		script.println("</script>");

		script.close();		
	

%>