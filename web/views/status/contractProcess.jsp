<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.pkb.reservation.model.vo.*"%>
    <%
    Contract c = (Contract)request.getAttribute("c");
    int cnum = c.getContract_no();
    String cstatus = c.getContract_status();
    int cUserno = c.getUser_no();
   
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/menubar.jsp"%>
<%
	if(loginUser.getUser_no() == cUserno && cstatus.equals("W")){
%>
<%@include file="../status/RsvStatement.jsp" %>
<% } else  {%>
<b>요청완료 페이지 출력부분안됨</b>
<% } %>
</body>
</html>