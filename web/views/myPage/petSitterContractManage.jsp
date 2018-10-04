<%@page import="java.util.ArrayList"%>
<%@page import="com.pkb.reservation.model.vo.Contract"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArrayList<Contract> cList = (ArrayList<Contract>)request.getAttribute("cList");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<meta charset="UTF-8">
<title>Petsitter Contract Management</title>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<%
		if(loginUser == null || loginUser.getUser_grade() != 3){
	%>
	<script>
		alert('펫시터 회원만 이용할 수 있습니다!');
		window.location.href = '<%=request.getContextPath()%>/index.jsp';
	</script>
	<% } else {%>
	<%@ include file="/views/common/sidemenubar.jsp"%>
	<% if (cList == null) { %>
	<div class="error">
	<h2>유효한 계약 정보가 아직 없습니다</h2>
	</div>
	<% } else { %>	
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
			<% if(c.getContract_type().equals("c")){ %>
			<td>위탁</td>
			<% } else { %>
			<td>방문</td>
			<% } %>
			<td><%= c.getContract_start() %></td>
			<td><%= c.getContract_end() %></td>
			<td><%= c.getContract_date() %></td>
			<% if(c.getContract_status().equals("W")) { %>
			<td>
			<form id="acceptRequest" action="<%=request.getContextPath()%>/acceptReq.do" method="post">
				<input type="hidden" id="pst_user_no" name="pst_user_no" value="<%= loginUser.getUser_no() %>">
				<input type="hidden" id="psrno" name="psrno" value="<%= c.getPet_service_regno() %>">
				<input type="hidden" id="client_user_no" name="client_user_no" value="<%= c.getUser_no() %>">
				<input type="hidden" id="contractNo" name="contractNo" value="<%= c.getContract_no() %>">			
				<input type="submit" name="acceptReq" value="수락">
				<input type="submit" name="acceptReq" value="취소">
			</form>
			</td>
			<% } else if (c.getContract_status().equals("E")){ %>
			<td>결제상태: <%= c.getService_status() %></td>
			<% } else { %>
			<td><%= c.getContract_status() %></td>
			<% } %>
		</tr>	
	<% } %>
	</table>
	</div>
	<% } } %>
	
<!-- footer -->
				<%@ include file="/views/common/footer.jsp" %>
	
</body>
</html>