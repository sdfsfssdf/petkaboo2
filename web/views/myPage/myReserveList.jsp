<%@page import="java.sql.Date"%>
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
<style>

button{
 display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    touch-action: manipulation;
    cursor: pointer;
	user-select: none;
	border: 1px solid transparent;
    border-radius: 4px;
}

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
		if(loginUser == null){
	%>
	<script>
		alert('로그인 후 이용해 주세요!');
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
				<!-- 내 펫시터 예약 목록 -->
				&nbsp;&nbsp;&nbsp;&nbsp;<span
					style="text-align: left; font-size: 17px; font-weight: bold; ">내 펫시터 예약 목록</span>
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
				<th width="100px">환불</th>			
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
			<% if(c.getContract_status() != null && c.getContract_status().equals("W")) { %>
			<td>수락 대기 중</td>
			<% } else if(c.getContract_status() != null && c.getContract_status().equals("C")) { %>
			<td><font color="red"><b>취소</b></font></td>
			<% } else if(c.getService_status() != null && c.getService_status().equals("W")) { %>
			<td>
			<form id="paymentReq" action="<%=request.getContextPath()%>/paymentReq.do" method="post">
			<input type="hidden" id="pst_user_no" name="pst_user_no" value="<%= c.getPet_user_no() %>">
			<input type="hidden" id="psrno" name="psrno" value="<%= c.getPet_service_regno() %>">
			<input type="hidden" id="user_no" name="user_no" value="<%= loginUser.getUser_no() %>">
			<input type="hidden" id="contractNo" name="contractNo" value="<%= c.getContract_no() %>">			
			<button style="background-color:#9bcdf7; color:white; border:1px solid #9bcdf7;">결제요청</button>
			</form></td>
			<% } else if(c.getService_status() != null && c.getService_status().equals("X")) {%>
				<td>서비스 종료</td>
			<% } else if(c.getService_status() != null && c.getService_status().equals("F")) { %>
				<td><font color="blue"><b>환불 처리 중</b></font></td>
			<% } else if(c.getService_status() != null && c.getService_status().equals("E")) { 
				java.util.Date utilDate = new java.util.Date();
				Date sqlDateToday = new java.sql.Date(utilDate.getTime());
				Date endContract = c.getContract_end();
				Date startContract = c.getContract_start();
				int dateResult = sqlDateToday.compareTo(startContract);
					if(dateResult > 0){ %>
					<% dateResult = sqlDateToday.compareTo(endContract); %>
						<% if(dateResult > 0){ %>
						<td>서비스 완료</td>
						<% } else { %>
						<td>결제 완료. 서비스 진행 중</td>
						<% } %>
					<% } else { %>
						<td>결제완료. 서비스 진행 대기 중</td>
					<% } %>
			<% } %>
			<% if (c.getService_status() != null && (c.getService_status().equals("P") || c.getService_status().equals("E"))){ %>
				<td>
					<form name="refundReq" method="post" action="refundReq.do">
					<input type="hidden" name="contractNo" value="<%= c.getContract_no() %>">
					<button>환불</button>
					</form>
				</td>
			<% }else{ %>
				<td>
					<b>환불 불가</b>
				</td>
			<% } %>
		</tr>
	<% } %>
	</table>
	</div>
	</div>
	<!-- fixed 창 -->
			<%@ include file="../common/fixed.jsp"%>
	<div class="content-right"></div>
	<% }%>
	<!-- footer -->
				<%@ include file="/views/common/footer.jsp" %>
	
	<%  } %>
</body>
</html>