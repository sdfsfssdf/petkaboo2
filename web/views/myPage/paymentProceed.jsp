<%@page import="com.pkb.member.model.vo.CyberMoney"%>
<%@page import="com.pkb.reservation.model.vo.Contract"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Contract c = (Contract)request.getAttribute("c");
	CyberMoney cm = (CyberMoney)request.getAttribute("cMoney");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<meta charset="UTF-8">
<title>최종 결제 확인</title>
</head>
<body>
	<!-- menubar include -->
	<%@ include file="../common/menubar.jsp"%>
	<%
		if(loginUser == null){
	%>
	<script>
		alert('로그인 후 이용해 주세요!');
		window.location.href = '<%=request.getContextPath()%>/index.jsp';
	</script>
	<% } else { %>
	<% 
		long diff = (c.getContract_end().getTime() - c.getContract_start().getTime()); 
		int diffDays = (int)(diff / (24 * 60 * 60 * 1000));
	%>
	<div class="paymentProceedDiv">
		<table id="paymentProceedInfoTable">
			<tr>
				<td><b><%= c.getPetNickname() %></b> 펫시터와의 계약을 결제합니다.</td>
			</tr>
			<tr>
				<td>아래 내용을 정확히 확인하시고 결제 버튼을 누르세요.</td>
			</tr>
			<tr>
				<td><b><%= c.getPet_categoryName() %></b><b> <%= c.getPet_no() %></b>마리를</td>
			</tr>
			<tr>
				<td><b><%= c.getContract_start() %></b>일 부터 <b><%= c.getContract_end() %></b>일 까지 총 <%= diffDays %>일간,</td>
			</tr>
			<tr>
				<td>일 <b><%= c.getService_charge() %></b>원에 <% if(c.getContract_type() != null && c.getContract_type().equals("c")) {	%>
				위탁 <% } else { %> 방문 <% } %> 서비스로 계약합니다.</td>
			</tr>
			<tr>
				<% int fullPrice = c.getService_charge() * c.getPet_no() * diffDays; %>
				<td>총 금액: <%= fullPrice %>원</td>
			</tr>
			<tr>
				<td><b>
				<% if(loginUser.getNickname() != null) { %>
				<%= loginUser.getNickname() %>
				<% } else { %>
				<%= loginUser.getEmail() %><% } %>
				</b>님의 잔여 사이버머니: <%= cm.getMoney() %>원 </td>
			</tr>
		</table>
		<form id="paymentProceed" action="<%=request.getContextPath()%>/PaymentProceed.do" method="post">
		<input type="hidden" name="contractno" value="<%= c.getContract_no() %>">
		<input type="hidden" name="user_no" value="<%= loginUser.getUser_no() %>">
		<input type="hidden" name="fullPrice" value="<%= fullPrice %>">
		<button>결제 진행</button>
		</form>
	</div>
	<% } %>
</body>
</html>