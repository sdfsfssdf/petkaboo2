<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
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
<style>
.content-left {
	width: 15%;
	float: left;
	border: 1px solid transparent;
}

.content-right {
	width: 15%;
	float: left;
	border: 1px solid transparent;
}

.content-center {
	width: 70%;
	float: left;
	/* text-align:center; */
	margin: 0 auto;
	margin-top:80px;
}

tr{
border : 1px solid #eee;
height:40px;
text-align:center;
color:white;
background-color:#9bcdf7;
}
.myContractInfoTable{

}
td{
width:10%;
color:black;
background-color:white;

}
</style>
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
	<div class="content-left"><%@ include file="/views/common/sidemenubar.jsp"%></div>
	<% if (cList == null) { %>
	<div class="error">
	<h2>유효한 계약 정보가 아직 없습니다</h2>
	</div>
	<% } else { %>	
	<div class="content-center">
	<hr
						style="border: thin solid lightgray !important; display: inline-block !important; width: 100% !important;" />
				
				<br>
				<!-- 내 계약 현황 -->
				&nbsp;&nbsp;&nbsp;&nbsp;<span
					style="text-align: left; font-size: 17px; font-weight: bold; ">내 계약 현황</span>
				<hr
					style="border: thin solid lightgray !important; display: inline-block !important; width: 100% !important;" />
	<br><br>
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
			<% } else if (c.getService_status() != null && c.getService_status().equals("E")) {
				java.util.Date utilDate = new java.util.Date();
				Date sqlDateToday = new java.sql.Date(utilDate.getTime());
				Date endContract = c.getContract_end();
				Date startContract = c.getContract_start();
				int dateResult = sqlDateToday.compareTo(endContract);
					if(dateResult > 0){ %>
					<td>
						<b>서비스 완료</b>
						<form id="endContract" action="<%=request.getContextPath()%>/endContract.do" method="post">
							<input type="hidden" name="client_user_no" value="<%= c.getUser_no() %>">
							<input type="hidden" id="psrno" name="psrno" value="<%= c.getPet_service_regno() %>">
							<input type="hidden" name="contractNo" value="<%= c.getContract_no() %>">
							<input type="submit" name="endContract" value="완료">
						</form>
					</td>
			<% 		} else {	%>
			<%		dateResult = sqlDateToday.compareTo(startContract); %>
			<%			if(dateResult > 0) { %>
					<td><b>결제완료. 펫시팅 진행 중</b></td>
			<%  } else { %>
					<td><b>결제완료. 펫시팅 진행 대기 중</b></td>
			<% } %>
			<% } %>
			<% } else if (c.getService_status() != null && c.getService_status().equals("F")){%>
				<td>
					<b>환불 대기 중</b>
				</td>
			<% } else if (c.getService_status() != null && c.getService_status().equals("R")){%>
				<td>
					<b>환불 완료</b>
				</td>
			<% } else if(c.getService_status() != null && c.getService_status().equals("X")) { %>
			<td><b>종료</b></td>
			<% } else if(c.getContract_status() !=null && c.getContract_status().equals("C")) { %>
			<td><b>취소</b></td>
			<% } else if(c.getService_status() != null && c.getService_status().equals("W")) { %>
			<td><b>결제 대기중</b></td>
			<% } else {%>
			<td><%= c.getContract_status() %></td>
			<% } %>
		</tr>	
	<% } %>
	</table>
	</div>
	</div>
	<!-- fixed 창 -->
			<%@ include file="../common/fixed.jsp"%>
	<div class="content-right"></div>
	<% } %>

	<!-- footer -->
				<%@ include file="/views/common/footer.jsp" %>
	
	<% } %>
	

	

</body>
</html>