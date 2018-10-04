<%@page import="com.pkb.reservation.model.vo.Contract"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArrayList<Contract> cList = (ArrayList<Contract>)request.getAttribute("cList");
%>    
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<meta charset="UTF-8">
<title>내 펫시터 예약 목록</title>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<%
		if(loginUser == null){
	%>
	<script>
		alert('로그인 후 이용해 주세요!');
		window.location.href = '<%=request.getContextPath()%>/index.jsp';
	</script>
	<% } else {%>
	<%@ include file="/views/common/sidemenubar.jsp"%>
	<% if (cList == null) { %>
	<div class="error">
	<h2>유효한 계약 정보가 아직 없습니다</h2>
	</div>
	<% } else { %>	
	<div class="content-left"></div>
	<div class="content-center">
	<div class="myContractDiv">
		<table id="myContractInfoTable">
			<tr>
				<th width="100px">서비스번호</th>
				<th width="100px">동물카테고리</th>
				<th width="100px">서비스 종류</th>
				<th width="150px">시작일</th>
				<th width="150px">종료일</th>
				<th width="100px">계약요청일</th>
				<th width="50px">상태</th>			
			</tr>
	<% for (Contract c : cList) { %>
		<tr>
			<td><%= c.getPet_service_regno() %></td>
			<td><%= c.getPet_categoryName() %></td>
			<% if(c != null && c.getContract_type().equals("c")){ %>
			<td>위탁</td>
			<% } else { %>
			<td>방문</td>
			<% } %>
			<td><%= c.getContract_start() %></td>
			<td><%= c.getContract_end() %></td>
			<td><%= c.getContract_date() %></td>
			<% if(c.getService_status() != null && c.getService_status().equals("W")) { %>
			<td>
			<form id="paymentReq" action="<%=request.getContextPath()%>/paymentReq.do" method="post">
			<input type="hidden" id="pst_user_no" name="pst_user_no" value="<%= c.getPet_user_no() %>">
			<input type="hidden" id="psrno" name="psrno" value="<%= c.getPet_service_regno() %>">
			<input type="hidden" id="user_no" name="user_no" value="<%= loginUser.getUser_no() %>">
			<input type="hidden" id="contractNo" name="contractNo" value="<%= c.getContract_no() %>">			
			<button>결제요청</button>
			</form></td>
			<% } else { %>
			<td><%= c.getContract_status() %></td>
			<% } %>
		</tr>	
	<% } %>
	</table>
	</div>
	</div>
	<div class="content-right"></div>
	<% }%>
	<!-- footer -->
				<%@ include file="/views/common/footer.jsp" %>
	
	<%  } %>
</body>
</html>