<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.pkb.reservation.model.vo.*,com.pkb.common.Paging"%>
<%
	HashMap<String,Object> totalMap = (HashMap<String,Object>)request.getAttribute("totalInfo");
	ArrayList<Integer> counts = (ArrayList<Integer>)totalMap.get("counts");
	ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)totalMap.get("list");
	Paging pg = (Paging)request.getAttribute("pg");
	int listCount = pg.getListCount();
	int currentPage = pg.getCurrentPage();
	int maxPage = pg.getMaxPage();
	int startPage = pg.getStartPage();
	int endPage = pg.getEndPage();	
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	.outer{
		float:left;
		width:1000px;
		height:1000px;
		color:black;
		margin-left:20px;
		margin-right:auto;
		margin-top:20px;
	}
	.first-row{
		float:left;
		width:100%;
	}
	.table1{
		float:left;
		width:1000px;
		margin-top:20px;
		marign-left:auto;
		margin-right:auto;
		padding-left:50px;
	}
	.head > th{
		background: #ddd;
		text-align:center;
	}
	
	.leftWrapArea{
      height:1250px !important;      
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%@include file="../main/header.jsp" %>
		<%@include file="leftMenu.jsp" %>
		<div class="outer">
		<div class="first-row">
		<div class="table1">
		
		
		<table class="table table-hover">
		<tr class="header">
			<th>전체</th>
			<th>대기</th>
			<th>결제대기</th>
			<th>결제완료</th>
			<th>진행</th>
		</tr>
		<tr>
			<%for ( int i = 0 ; i < counts.size() ; i ++) { %>
				<td><%=counts.get(i) %></td>
				
			<%} %>
		
		</tr>
		</table>
		<div class="progress">
    <div class="progress-bar progress-bar-info"  role="progressbar" style="width:<%=(counts.get(1)*100)/counts.get(0)%>%">
      Wait
    </div>
    <div class="progress-bar progress-bar-warning" role="progressbar" style="width:<%=(counts.get(2)*100)/counts.get(0)%>%">
      Payment wait
    </div>
    <div class="progress-bar progress-bar-danger" role="progressbar" style="width:<%=(counts.get(3)*100)/counts.get(0)%>%">
      Payment Complete
    </div>
    <div class="progress-bar progress-bar-success" role="progressbar" style="width:<%=(counts.get(4)*100)/counts.get(0)%>%">
      Progress
    </div>
	</div>	
	<hr>
		<table class="table table-hover">
		<tr class="header">
				<th>계약번호</th>
				<th>계약일</th>
				<th>서비스시작일</th>
				<th>서비스종료일</th>
				<th>계약상태</th>
			</tr>
			
			<%for(int i = 0; i < list.size() ; i ++) { %>
				<tr>
					<td><%=list.get(i).get("contract_no")%></td>
					<td><%=list.get(i).get("contract_date") %></td>
					<td><%=list.get(i).get("contract_start") %></td>
					<td><%=list.get(i).get("contract_end") %></td>
					<td>
						<%if(list.get(i).get("contract_status").equals("W")) {%>
							<div align="center" style="width:80px; color:white; background:#5bc0de">Wait</div>
						<%} else {%>
							<%if(list.get(i).get("service_status").equals("W")) { %>
								<div align="center" style="width:80px; color:white; background:#f0ad4e">P.wait</div>
							<%} else if(list.get(i).get("service_status").equals("E")) {  %>
								<div align="center" style="width:80px; color:white; background:#d9534f">P.Complete</div>
							<%} else if(list.get(i).get("service_status").equals("P")) {  %>
								<div align="center" style="width:80px; color:white; background:#5cb85c">Progress</div>
							<%} %>
						<%} %>
					</td>
				</tr>
			<%} %>
		</table>
		<div class="spaceDiv" align="center">
			<div class="pigingArea">
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/selectMainInfo.re?currentPage=1'"><<</button>
				<%
					if (currentPage <= 1) {
				%>
				<button class="btn btn-default" disabled><</button>
				<%
					} else {
				%>
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/selectMainInfo.re?currentPage=<%=currentPage - 1%>'"><</button>
				<%
					}
				%>

				<%
					for (int p = startPage; p <= endPage; p++) {
						if (p == currentPage) {
				%>

				<button class="btn btn-default" disabled><%=p%></button>
				<%
					} else {
				%>
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/selectMainInfo.re?currentPage=<%=p%>'"><%=p%></button>
				<%
					}
				%>
				<%
					}
				%>

				<%
					if (currentPage >= maxPage) {
				%>
				<button class="btn btn-default" disabled>></button>
				<%
					} else {
				%>
				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/selectMainInfo.re?currentPage=<%=currentPage + 1%>'">></button>
				<%
					}
				%>

				<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath()%>/selectMainInfo.re?currentPage=<%=maxPage%>'">>></button>
			</div>
			</div>
		
		</div></div></div>
</body>
</html>